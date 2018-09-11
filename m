From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 11 Sep 2018 18:09:23 +0300
Subject: [PATCH v3 0/2] GPIO: add single-register GPIO via CREG driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add single-register MMIO GPIO driver for complex cases where
only several fields in register belong to GPIO lines and each GPIO
line owns a field with different length and on/off value.

Such CREG GPIOs are used in Synopsys AXS10x and HSDK boards.

Changes v2->v3:
 * Move parameters into a lookup table instead of device tree.
 * Use the ngpios attribute for instead of snps,ngpios.

Eugeniy Paltsev (2):
  GPIO: add single-register GPIO via CREG driver
  dt-bindings: Document the Synopsys GPIO via CREG bindings

 .../devicetree/bindings/gpio/snps,creg-gpio.txt    |  18 ++
 MAINTAINERS                                        |   6 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-creg-snps.c                      | 212 +++++++++++++++++++++
 5 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
 create mode 100644 drivers/gpio/gpio-creg-snps.c

-- 
2.14.4
