Return-Path: <SRS0=3D0g=C3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4BCC43467
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2020 11:23:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D1A21D42
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2020 11:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JzP67myp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D1A21D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o6OQvqYSjiDxlwehxZI5IxBCKXifZJBX/d31GkXrbFo=; b=JzP67myp5AwYqwBaq4BMXdr8tn
	tKzwE0Gc5XyRcmkb42iB2Vbs7au7tQacREpS63ai1kTPNv2N6WeSztkDlcyoUhh6y/fYQ5DvwdzzQ
	GhAOW3gwCFnVfxmK62GksPauaF/F3ZiQXzB3BAIYWx2X9IrDPq3NmKS5sxQSYh5qn+AFkmt6CT94v
	ie2eiv6GXcUT+rrUgZL1qArYd9FEFOkJTvIydPRHWN/xgt2I8xAtS3NhaNgfuI8+lex47dSazbqQu
	YV23toV/uJ+T+uZTfBKZq/aTwwG8O7vA+Zq4XkiWhbn45wv0n71HR4ovY/3bIC8H3ZimKqYr3QemZ
	BHMAU/Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJETm-0001xY-RO; Fri, 18 Sep 2020 11:23:02 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJETj-0001us-Ru
 for linux-snps-arc@lists.infradead.org; Fri, 18 Sep 2020 11:23:01 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1F4EFB19B69D7C9B0CE8;
 Fri, 18 Sep 2020 19:22:52 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.253) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 19:22:45 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>, linux-snps-arc
 <linux-snps-arc@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/6] irqchip: dw-apb-ictl: support hierarchy irq domain
Date: Fri, 18 Sep 2020 19:21:56 +0800
Message-ID: <20200918112202.3418-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_072300_163982_47E828C4 
X-CRM114-Status: GOOD (  11.38  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Haoyu Lv <lvhaoyu@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Libin <huawei.libin@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

v4 --> v5:
1. Add WARN_ON(1) in set_handle_irq() if !GENERIC_IRQ_MULTI_HANDLER
2. Convert "snps,dw-apb-ictl.txt" to "snps,dw-apb-ictl.yaml"
3. Fix the errors detected by "snps,dw-apb-ictl.yaml" on arch/arc

v3 --> v4:
1. remove "gc->chip_types[0].chip.irq_eoi = irq_gc_noop;", the "chip.irq_eoi" hook
   is not needed by handle_level_irq(). Thanks for Marc Zyngier's review.
2. Add a new patch: define an empty function set_handle_irq() if !GENERIC_IRQ_MULTI_HANDLER
   to avoid compilation error on arch/arc system.

v2 --> v3:
1. change (1 << hwirq) to BIT(hwirq).
2. change __exception_irq_entry to __irq_entry, so we can "#include <linux/interrupt.h>"
   instead of "#include <asm/exception.h>". Ohterwise, an compilation error will be
   reported on arch/csky.
   drivers/irqchip/irq-dw-apb-ictl.c:20:10: fatal error: asm/exception.h: No such file or directory
3. use "if (!parent || (np == parent))" to determine whether it is primary interrupt controller.
4. make the primary interrupt controller case also use function handle_level_irq(), I used 
   handle_fasteoi_irq() as flow_handler before.
5. Other minor changes are not detailed.

v1 --> v2:
According to Marc Zyngier's suggestion, discard adding an independent SD5203-VIC
driver, but make the dw-apb-ictl irqchip driver to support hierarchy irq domain.
It was originally available only for secondary interrupt controller, now it can
also be used as primary interrupt controller. The related dt-bindings is updated
appropriately.

Add "Suggested-by: Marc Zyngier <maz@kernel.org>".
Add "Tested-by: Haoyu Lv <lvhaoyu@huawei.com>".


v1:
The interrupt controller of SD5203 SoC is VIC(vector interrupt controller), it's
based on Synopsys DesignWare APB interrupt controller (dw_apb_ictl) IP, but it
can not directly use dw_apb_ictl driver. The main reason is that VIC is used as
primary interrupt controller and dw_apb_ictl driver worked for secondary
interrupt controller. So add a new driver: "hisilicon,sd5203-vic".

Zhen Lei (6):
  genirq: define an empty function set_handle_irq() if
    !GENERIC_IRQ_MULTI_HANDLER
  irqchip: dw-apb-ictl: prepare for support hierarchy irq domain
  irqchip: dw-apb-ictl: support hierarchy irq domain
  dt-bindings: dw-apb-ictl: support hierarchy irq domain
  dt-bindings: dw-apb-ictl: convert to json-schema
  ARC: [dts] fix the errors detected by dtbs_check

 .../interrupt-controller/snps,dw-apb-ictl.txt      | 31 --------
 .../interrupt-controller/snps,dw-apb-ictl.yaml     | 75 +++++++++++++++++++
 arch/arc/boot/dts/axc001.dtsi                      |  2 +-
 arch/arc/boot/dts/axc003.dtsi                      |  2 +-
 arch/arc/boot/dts/axc003_idu.dtsi                  |  2 +-
 arch/arc/boot/dts/vdk_axc003.dtsi                  |  2 +-
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              |  2 +-
 drivers/irqchip/Kconfig                            |  2 +-
 drivers/irqchip/irq-dw-apb-ictl.c                  | 83 ++++++++++++++++++----
 include/linux/irq.h                                |  6 ++
 10 files changed, 158 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml

-- 
1.8.3



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
