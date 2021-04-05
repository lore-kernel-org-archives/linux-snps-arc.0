Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B334CC4360C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F90D6128D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F90D6128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJGdKiTJcEk0Nwn0F9DFdGFD8UFQQuAF7stRE/dfUVc=; b=brqFMHoRmQiOqxYhX66itvZ76
	daqVtACz5x2U6I31Ixcv9sf45NEZj+d8NvAgY09Gdu1HkzXjisHifFZMwr6c5N5juTfGdAtDh43/A
	lgtfb1EqApQ4VRg0f1bF9Ro8XrVzNXUvxJO7cPd+7p9hTPM2jyuwhqKXmPwZsCsJUVg6rhgrXIqok
	YpQXg9AgabYCEn4H0i53N+eX5WZmwv2GquigB8ec6WakcWl7iJts3QIt5BtGGwkT4xv0PvnL6dZmw
	ncvVaNdf9VGEObaVD5zWL1X5f9ARRG+i7wML5VBspW19SsCYRPJoSruAmrciXYWf/EfTI8Cawkzao
	JxZK7KPtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHG-00HPcC-Ku; Mon, 05 Apr 2021 14:32:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHB-00HPZp-9P
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id x15so1888395wrq.3
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tN982wSTimgJQpbgAF5dTe88Jpv8iR9TuFZglHbAqQY=;
 b=uchPUxVpWgkeeCm0RoeMNpnBbcuSovNAy4bhfItKn7P6sB8A1pLn4WdtEuDbIPNViB
 9+x4nN8ITZpbrhnwI4OXR7e39hLJIijJadsoYbhwdQEUU2nQ/Q50z2aIsuFHrvEXrXyK
 MrAkUFrHm9EOCXBefBk2eYecffqu9h+g4e3w4HVEFIxI6w3LfsMdxGepXLKDygOZIf8q
 ayGk2QZoXcWntoulyBvRvw9UCB8pPC6eHPXG9wEl+h/WTP8dR1T9b0bVxc4Lz6jLmcl+
 VwKCzSdHxs8qj/cvVWELEMkttb4nH0x4IUT6F1Xkl622qoYglzMihC1KutDETCT0wq71
 TcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tN982wSTimgJQpbgAF5dTe88Jpv8iR9TuFZglHbAqQY=;
 b=AXNka8fjAMLed0/pc2+INgfcFyWCp5fq77lZvVvnQ9xngEr+6/g0BhZ1tdc2LJi2pk
 k4v8ts1RIaQm5wKxsvTuui29wNT8XQ5phylc5hU/KuYmp+YJ8x/9Ya9DPmSpj0W6tyiW
 kZGFKj1VaySMNuGc5opXj1/YnBGMbDTF0ggHkz0hzOzR1jRJTQJ8ZeLew1yKVyD7q1Iw
 JeesU7awspdCS2iIOJpCsoftaGna+58Js8B0M4ALa/LCzZuZeyKl7igoRSU+Z5kuvaj1
 Ak5pDruGmpkTa/bGgIqtycEQDWP36Y9wbcbRowtCDhlMQET5fB5ZaHM+3T4c5X8PDibi
 qoaQ==
X-Gm-Message-State: AOAM531GdYNwCysQ2bJHdmz6MdJ7MvP0COkY7nuMP6RYSsPHdaH1SI3S
 EJ4asJ2yVwGFGmbFnqhrpRw=
X-Google-Smtp-Source: ABdhPJz7rBMtq15Ge5QuefBp0/XacyrDVL09iMHmEA5A8wihBu+tn2xI62JaG4hAIfl1DqlBhOVtzQ==
X-Received: by 2002:a5d:5503:: with SMTP id b3mr6403600wrv.242.1617633144735; 
 Mon, 05 Apr 2021 07:32:24 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:24 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 16/27] tests/acceptance: ARC: Add linux boot testing.
Date: Mon,  5 Apr 2021 15:31:27 +0100
Message-Id: <20210405143138.17016-17-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153225_700683_03E0C5E6 
X-CRM114-Status: UNSURE (   7.83  )
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

Just an acceptance test with ARC Linux booting.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 1ca32ecf25..b5a781b6b4 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -138,6 +138,26 @@ def test_mips_malta(self):
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
@@ -966,6 +986,17 @@ def test_alpha_clipper(self):
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
@@ -1086,3 +1117,27 @@ def test_xtensa_lx60(self):
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
