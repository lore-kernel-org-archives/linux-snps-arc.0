Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3D3C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A8D6139E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A8D6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ILeqZYWphncK4Xuh3xG3ZsJHhXlA2Vt1OCuQSSM7jWQ=; b=DlPl9doB5FaTSK1OMhFCSR+uX
	mABpsIqM3WzaoLOrEVCb7B3p2lwGa91Afe8gl0I5/aDgQZJZ3opiUqSSb3pRKDMW3Og5Lwngeysez
	KUnQRMe+kGAsCuzNX5K7gn4HpKniO3jOqw7PB08mBhQeXioZHxv1r4WI+IX/7wUXO+ZrEkUPVb27D
	uuVTe2htjn9AxxZVXzdhXd+oyaQ3uIeoQfTBQvvd98OXDGXW7P3tna22ZtmeHjSW52MAhuDd50NMp
	B2QsixVkeH2Q9b/SxcwkMEO8i1zyjsI2Ut0Ed/bomg8vJiocydzvjO7vowbeFkpDjqlGPbnKlag3H
	TooR7NFHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHW-00HPj6-2I; Mon, 05 Apr 2021 14:32:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHN-00HPfR-IX
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id k128so5809347wmk.4
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DUse1n/oBxKc6TNMgInqNeRNbQw//OjkdVm9LIiyh7o=;
 b=j0WHpnXgd0Zn+eBq+UvSwfafJC0Zz9fVPZwOnXwVcHdlPupFEqDWJijGmZzXzrmX0/
 UhGli4wHnrkduI88HL3F2HqWhH1uCQAkVe4k4pHQttCfr2sYsM3q9oGJZbQ0woNDnHPP
 0c5AT1mThafy2z210LPN3TfXjNgQOwKASsAzY5gZfrA/pspW7sL6kNXMkby7gNuBlHoQ
 HlKGQKFH6ZURpA1dnwwtUtWZd7ko1RcxFq4K3EEcsoZ4HuMq1LL6tAu7N07ePErO417B
 0OIbNgz00amcAKIcM/Za0AV6RXdNewXpUI6uZeBsvPyfdqYDfAelQVDDm+RUo+12XLKT
 PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUse1n/oBxKc6TNMgInqNeRNbQw//OjkdVm9LIiyh7o=;
 b=VNmRckCHHKhvO/qyi9zOUFrIX9xXC9yILaEQ+z9a97Dv90rwkloJBgcXSnV3CxEIEn
 t9noW0UqUOgYoudo7GnY/vkL3zx+SKPvO7RJcGzGhDlQycdW9DnwnFstHCiuPIM2vdWm
 bpvze1MisvBI20Pw9UlBRJ0QpPX5kI3M2XuhecOzWCsh3SCzhoHRaco/jO3IUJzgxMRt
 8Rlu6HRVnMjkOiUOOi0l+6F0ZyfBD6y+0C318wccDjpBKAAWY/2LNWJ73ki5k5Hh7ulB
 fJ5Iz4RlbEF+SvIDS8QTQ3CjXo7uQeUGgq0RP1MbjaCOG+z3hmSu007PFehCGV5Z0um6
 W/Uw==
X-Gm-Message-State: AOAM530aWo9ydizyKRrmTkUGps2KDeNU8qIov2cu1zs4+x5wmzqf7YjM
 cgrcRa9+DSQ0YHs3W9+3zlpHCaUIcG2ugg==
X-Google-Smtp-Source: ABdhPJwNluAuZQQbGzUhv8F3FUDcVGNUTynAjV0CLOWu8OZLKUqfLO/xGmITC3piZZNckZGrMyxyXQ==
X-Received: by 2002:a05:600c:2145:: with SMTP id
 v5mr25815101wml.65.1617633157256; 
 Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 26/27] arcv3: board changes
Date: Mon,  5 Apr 2021 15:31:37 +0100
Message-Id: <20210405143138.17016-27-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153237_713706_4234410B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 hw/arc/boot.c | 1 +
 hw/arc/virt.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/arc/boot.c b/hw/arc/boot.c
index 962fc03b03..0af559e44b 100644
--- a/hw/arc/boot.c
+++ b/hw/arc/boot.c
@@ -69,6 +69,7 @@ void arc_load_kernel(ARCCPU *cpu, struct arc_boot_info *info)
     }
 
     elf_machine = cpu->family > 2 ? EM_ARC_COMPACT2 : EM_ARC_COMPACT;
+    elf_machine = (cpu->family & ARC_OPCODE_V3_ALL) != 0 ? EM_ARC_COMPACT3_64 : elf_machine;
     kernel_size = load_elf(info->kernel_filename, NULL, NULL, NULL,
                            &entry, NULL, NULL, NULL, ARC_ENDIANNESS_LE,
                            elf_machine, 1, 0);
diff --git a/hw/arc/virt.c b/hw/arc/virt.c
index 8f7d7cbd5d..e07fa5c123 100644
--- a/hw/arc/virt.c
+++ b/hw/arc/virt.c
@@ -120,7 +120,11 @@ static void virt_init(MachineState *machine)
     boot_info.kernel_cmdline = machine->kernel_cmdline;
 
     for (n = 0; n < smp_cpus; n++) {
+#ifdef TARGET_ARCV2
         cpu = ARC_CPU(cpu_create("archs-" TYPE_ARC_CPU));
+#else
+        cpu = ARC_CPU(cpu_create("arc64-" TYPE_ARC_CPU));
+#endif
         if (cpu == NULL) {
             fprintf(stderr, "Unable to find CPU definition!\n");
             exit(1);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
