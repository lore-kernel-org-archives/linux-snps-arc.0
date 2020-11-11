Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC14C5517A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 16:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BCE22074B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 16:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OyGUm64M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMfpb5No"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BCE22074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Mr3EBgHQ3VOXuh/kPMHJ06JO//Uxf1f2sifZwLp6IY=; b=OyGUm64MCma6xcNiPrFTQ/yf0
	ikWehix1l+0DKLsABBvfyxU45kwUHm45/EXXG5Qk7J2skwWJWMf4eyn3jDlDb4JILKBxOFujOOkSE
	NAMCBM64Y6z004KDCX/DYk6qQUFw7Vck/XXhMDMJxC5tS/bnEFhaB69UC6nNjoBZsLZSLASAmwOYb
	mD2k/+rgY8qjQCn9Z9Xkh2Pi7qqxFhqac4AZfPGv516y3NchAtJIWbnqwAgoj+9qrPShangGO92VB
	EzLxTMh9bsIc5q/ynEWDjWM+Sc2vWAr0fDVurQrbKhnwZ0KUWcdzvcaIVk5UI3U89BusLloqlHtqa
	Hh1MsnFoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcspR-0003kD-ST; Wed, 11 Nov 2020 16:18:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcspG-0003fy-V8
 for linux-snps-arc@lists.infradead.org; Wed, 11 Nov 2020 16:18:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o15so3092144wru.6
 for <linux-snps-arc@lists.infradead.org>; Wed, 11 Nov 2020 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zi75fku0OFNQzErpcH7q/kQ/tyIaSHtSE/ulFmYsCsM=;
 b=fMfpb5NoiKVpBGPNWQ/PoXL0vwEFXbv60aSeDqpinj/2spVel/IoDNZ3J5UXe2PfOu
 fLBiTlEtdbp5ZqDz5mUfCFSxJLTxWGX6mjudCR4OUpPWc0tvYkx/fjqPOmaZaGvvZBiA
 idBqLc6m5oAyfWf4gw9SHRPuW+PwltrKa7pftbGlq3S7Z9aXLXReKY3FrkWroIOTKMHZ
 uhtSxNF7Q/+36A+4/NSeb9MUacyA6axwvbxJA18OF1vqsvpDMeZHywaoYT4QrHCXbmKe
 iijsthSP9xy8k9PZQy9nQKshcUsLxtfohWK+rtr+6OvnswNdTt5wd0suGU+cTk1Wus/O
 AJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zi75fku0OFNQzErpcH7q/kQ/tyIaSHtSE/ulFmYsCsM=;
 b=ccdzwpFW35V0I1JFX/XDR7WgkNbH+itSoKbr0UlkSoQoy7yqf7iZYcpqBSdYWUH2H/
 ZSzOiSf6zKe/dXUwhxj6c5Ghdx6gboKUcZptCBpIgzcEUg0pBfyIy9R9ynZYwqN0Rgv6
 tZ2QwGT4TEllUJ/zjOejA2Hw7+hFPsQ61zlsj12P6dhCOnGC8mJuhfI+7iowAkTb1IND
 WatoPNob1GMDZlH6K96b0RqS4ErW+KMySkAbmbw0evOsWMG7XYjKaa5elSN6AALxSCXR
 aV7a0giSwiDQyp9JYxsKZ0p9TGkzF4LpX3BQBnN3qCm/4ZaDC6/7VM6oKqpIBpXHlhfg
 W7Qg==
X-Gm-Message-State: AOAM530qSb6y9JjOz8UrhAMOvC1PCZlHYbFF0NBXAkH/0WDb6pqTrA9w
 c5uc3LoCxYT2M+b8d7Cg8/VAS3m0Nz8UqQ==
X-Google-Smtp-Source: ABdhPJyRlv9JNsAqkclndDNJ0ZTWBY0JlxAxgOhJlRffnW+s3lLjmYKn02w6wlF+s1MCYLT/o0cDhg==
X-Received: by 2002:adf:9104:: with SMTP id j4mr17993239wrj.198.1605111505451; 
 Wed, 11 Nov 2020 08:18:25 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:24 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] tests/acceptance: ARC: Add linux boot testing.
Date: Wed, 11 Nov 2020 16:17:58 +0000
Message-Id: <20201111161758.9636-16-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_111827_090087_9677E5BB 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

Just an acceptance test with ARC Linux booting.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8f433a67f8..3eae551905 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -137,6 +137,26 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips_malta(self):
+        """
+        :avocado: tags=arch:arc
+        """
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20130217T032700Z/pool/main/l/linux-2.6/'
+                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
+        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-archs')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips64el_malta(self):
         """
         This test requires the ar tool to extract "data.tar.gz" from
@@ -973,6 +993,17 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def do_test_arc(self, kernel_name, console=0):
+        tar_url = ('https://github.com/cupertinomiranda/arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        self.vm.set_console(console_index=console)
+        self.vm.add_args('-kernel',
+                         self.workdir + '/' + kernel_name)
+        self.vm.launch()
+        self.wait_for_console_pattern('QEMU advent calendar')
+
     def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
@@ -1101,3 +1132,27 @@ class BootLinuxConsole(LinuxKernelTest):
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
         self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
+
+    timeout = 240
+    def test_arc_virt(self):
+        """
+        :avocado: tags=arch:arc
+        :avocado: tags=machine:virt
+        """
+
+        tar_url = ('https://github.com/cupertinomiranda/'
+                   'arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        kernel_path = self.workdir + '/arc-qemu-resources-master/vmlinux_archs'
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE)
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.add_args('-device', 'virtio-net-device,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0,hostfwd=tcp::5558-:21,hostfwd=tcp::5557-:23')
+        self.vm.launch()
+
+        console_pattern = 'Welcome to Buildroot'
+        self.wait_for_console_pattern(console_pattern)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
