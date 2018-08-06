From: linus.walleij@linaro.org (Linus Walleij)
Date: Mon,  6 Aug 2018 17:12:24 +0200
Subject: [PATCH 1/2] gpio: tb10x: Create local helper variables
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180806151224.2338-1-linus.walleij@linaro.org>
To: linux-snps-arc@lists.infradead.org

Create a local struct device *dev helper variable to make the code
easier to read.

Most GPIO drivers use "np" (node pointer) rather than "dn" (device node)
to point to the device tree node. Let's follow this convention.

Cc: linux-snps-arc at lists.infradead.org
Cc: Christian Ruppert <christian.ruppert at alitech.com>
Signed-off-by: Linus Walleij <linus.walleij at linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index a12cd0b5c972..422b0ac5a9de 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -169,29 +169,30 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 {
 	struct tb10x_gpio *tb10x_gpio;
 	struct resource *mem;
-	struct device_node *dn = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	int ret = -EBUSY;
 	u32 ngpio;
 
-	if (!dn)
+	if (!np)
 		return -EINVAL;
 
-	if (of_property_read_u32(dn, "abilis,ngpio", &ngpio))
+	if (of_property_read_u32(np, "abilis,ngpio", &ngpio))
 		return -EINVAL;
 
-	tb10x_gpio = devm_kzalloc(&pdev->dev, sizeof(*tb10x_gpio), GFP_KERNEL);
+	tb10x_gpio = devm_kzalloc(dev, sizeof(*tb10x_gpio), GFP_KERNEL);
 	if (tb10x_gpio == NULL)
 		return -ENOMEM;
 
 	spin_lock_init(&tb10x_gpio->spinlock);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	tb10x_gpio->base = devm_ioremap_resource(&pdev->dev, mem);
+	tb10x_gpio->base = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(tb10x_gpio->base))
 		return PTR_ERR(tb10x_gpio->base);
 
-	tb10x_gpio->gc.label		=
-		devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
+	tb10x_gpio->gc.label =
+		devm_kasprintf(dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
 	if (!tb10x_gpio->gc.label)
 		return -ENOMEM;
 
@@ -210,31 +211,31 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &tb10x_gpio->gc, tb10x_gpio);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not add gpiochip.\n");
+		dev_err(dev, "Could not add gpiochip.\n");
 		return ret;
 	}
 
 	platform_set_drvdata(pdev, tb10x_gpio);
 
-	if (of_find_property(dn, "interrupt-controller", NULL)) {
+	if (of_find_property(np, "interrupt-controller", NULL)) {
 		struct irq_chip_generic *gc;
 
 		ret = platform_get_irq(pdev, 0);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "No interrupt specified.\n");
+			dev_err(dev, "No interrupt specified.\n");
 			return ret;
 		}
 
 		tb10x_gpio->gc.to_irq	= tb10x_gpio_to_irq;
 		tb10x_gpio->irq		= ret;
 
-		ret = devm_request_irq(&pdev->dev, ret, tb10x_gpio_irq_cascade,
+		ret = devm_request_irq(dev, ret, tb10x_gpio_irq_cascade,
 				IRQF_TRIGGER_NONE | IRQF_SHARED,
-				dev_name(&pdev->dev), tb10x_gpio);
+				dev_name(dev), tb10x_gpio);
 		if (ret != 0)
 			return ret;
 
-		tb10x_gpio->domain = irq_domain_add_linear(dn,
+		tb10x_gpio->domain = irq_domain_add_linear(np,
 						tb10x_gpio->gc.ngpio,
 						&irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
-- 
2.17.0
