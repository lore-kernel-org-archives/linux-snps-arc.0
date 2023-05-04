Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF2C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 May 2023 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OhCRzymFAvSvQ0EME99n0aVVtA/NetEm5MGh7LbKLBM=; b=W8ZQodkYSn0RPv
	95dj4KaU2zJG5Oh1ICRZCFfjxfNvplwn1LnzjjUVpYmXkLXJbZMAfMIkb6K14jc+i/5QlL/1e4mUM
	LlojI/OLDoxUKBTzViVVxw5FRRxIRsxtCJMBbkfVAmvHcXjKK6B+mGXL+K439hcFSS6OWzKcbGQyM
	wFyX8xGZe5p843Aqg1Qz0mfOaeHByjaHsN+5wqkyJ7bcCzp4/BY/arxxhcEgNUrVYciRzCsMjZcrS
	oFEOa/Od00TKJGpLX+0emkTETIkgHNsz/pKRt/kZ+CqiuXIQ1NN9/GxvZwAs0lnkVSyGpkotDm7Cf
	cqsvJPjvOsLP8alDNHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudID-008U9J-2F;
	Thu, 04 May 2023 18:03:01 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudIB-008U8K-0f
	for linux-snps-arc@lists.infradead.org;
	Thu, 04 May 2023 18:03:01 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f19ab99540so8588925e9.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 04 May 2023 11:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683223375; x=1685815375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZDZ8YxdhDn5mPRZaBC8fY/+Z68in9GRyIAk1Dnoetc=;
        b=a+HXsbQDmsHjKyM5e6S7/1y6O2LKGFSHVF8nWFC1WHjF7uE8C4xFG5Sp6HdTO3vmyr
         TQ6D9tcPViCVki6IH2oFRH03eddCLRywYc6KEtmeYr7nnPt0WlRqggMbDM1kQl6GZMUc
         oHDTmDTkJDfxtpEATVWM8mttuyru+cCd+G3xwSb3ys4Ee4a5xBW3ua0n5eAxtz0YVOQL
         cL02H1n7GoDxJ8nSQr3x/ZLFaevB15LaWaCc24zvV9REenhG3SfLk55hStbyoqUuu5f2
         Va9zcdETJ1b8Q5k1KR6B8isJPhIBS7DIMz/yUUmEDV5dex/LcYl8rvyo/3on0YezwNnG
         c8Mw==
X-Gm-Message-State: AC+VfDzrwBo921UBL/y3MMzU5q0xduw2W+/YhR3qoTNyjFPpJ1MgA/VL
	8hx5Dj0pF0pwPLqrSwXfUok=
X-Google-Smtp-Source: ACHHUZ7DBR9JLJxcGYEzgKy6RZn8Pk58Li37tq9w2jOkGLDCeZjMsgu0U1JZXU2UqbD7d8dCxpFZQw==
X-Received: by 2002:a1c:6a0d:0:b0:3f1:72ee:97b7 with SMTP id f13-20020a1c6a0d000000b003f172ee97b7mr393450wmc.15.1683223374722;
        Thu, 04 May 2023 11:02:54 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a040:1a3:c11b:3ae6:1732:e587:a81f])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003f03d483966sm5560826wma.44.2023.05.04.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 11:02:54 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Yanteng Si <siyanteng@loongson.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-ia64@vger.kernel.org (open list:IA64 (Itanium) PLATFORM),
	linux-openrisc@vger.kernel.org (open list:OPENRISC ARCHITECTURE),
	linux-parisc@vger.kernel.org (open list:PARISC ARCHITECTURE),
	linux-sh@vger.kernel.org (open list:SUPERH)
Subject: [PATCH v3] docs: directive `alias` for redirects
Date: Thu,  4 May 2023 21:01:52 +0300
Message-Id: <20230504180210.727364-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_110259_244686_72557B69 
X-CRM114-Status: GOOD (  16.18  )
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

and several redirects for moved main arch pages

Problems:
- The documentation lacks hierarchy
- Relocating pages disrupts external links to
  the documentation and causes confusion for users

Benefits:
- Users can easily access relocated pages from external resources
- Using redirects frees up options for reorganizing the documentation

The solution:
- Introduced directive `alias` which declares previous path of
  a moved document as the argument.
- Redirects are implemented with Sphinx extension rediraffe_redirects.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

---

Changes:
- complete new implementation
---
 Documentation/arch/arc/index.rst        |  2 ++
 Documentation/arch/ia64/index.rst       |  2 ++
 Documentation/arch/index.rst            |  2 ++
 Documentation/arch/m68k/index.rst       |  2 ++
 Documentation/arch/nios2/index.rst      |  2 ++
 Documentation/arch/openrisc/index.rst   |  2 ++
 Documentation/arch/parisc/index.rst     |  2 ++
 Documentation/arch/sh/index.rst         |  2 ++
 Documentation/arch/sparc/index.rst      |  2 ++
 Documentation/arch/x86/index.rst        |  2 ++
 Documentation/arch/x86/x86_64/index.rst |  2 ++
 Documentation/arch/xtensa/index.rst     |  2 ++
 Documentation/conf.py                   |  9 +++++++
 Documentation/sphinx/alias.py           | 35 +++++++++++++++++++++++++
 Documentation/sphinx/requirements.txt   |  1 +
 15 files changed, 69 insertions(+)
 create mode 100644 Documentation/sphinx/alias.py

diff --git a/Documentation/arch/arc/index.rst b/Documentation/arch/arc/index.rst
index 7b098d4a5e3e..c2be040f04c3 100644
--- a/Documentation/arch/arc/index.rst
+++ b/Documentation/arch/arc/index.rst
@@ -15,3 +15,5 @@ ARC architecture
    =======
 
    * :ref:`genindex`
+
+.. alias:: arc/index
diff --git a/Documentation/arch/ia64/index.rst b/Documentation/arch/ia64/index.rst
index 761f2154dfa2..c4f973f17af2 100644
--- a/Documentation/arch/ia64/index.rst
+++ b/Documentation/arch/ia64/index.rst
@@ -17,3 +17,5 @@ IA-64 Architecture
    serial
 
    features
+
+.. alias:: ia64/index
diff --git a/Documentation/arch/index.rst b/Documentation/arch/index.rst
index 80ee31016584..11be66e23de4 100644
--- a/Documentation/arch/index.rst
+++ b/Documentation/arch/index.rst
@@ -26,3 +26,5 @@ implementation.
    sparc/index
    x86/index
    xtensa/index
+
+.. alias:: arch
diff --git a/Documentation/arch/m68k/index.rst b/Documentation/arch/m68k/index.rst
index 0f890dbb5fe2..9b5c34510fb7 100644
--- a/Documentation/arch/m68k/index.rst
+++ b/Documentation/arch/m68k/index.rst
@@ -18,3 +18,5 @@ m68k Architecture
    =======
 
    * :ref:`genindex`
+
+.. alias:: m68k/index
diff --git a/Documentation/arch/nios2/index.rst b/Documentation/arch/nios2/index.rst
index 4468fe1a1037..bfaf0e963db3 100644
--- a/Documentation/arch/nios2/index.rst
+++ b/Documentation/arch/nios2/index.rst
@@ -10,3 +10,5 @@ Nios II Specific Documentation
 
    nios2
    features
+
+.. alias:: nios2/index
diff --git a/Documentation/arch/openrisc/index.rst b/Documentation/arch/openrisc/index.rst
index 6879f998b87a..b59d97d6f8b7 100644
--- a/Documentation/arch/openrisc/index.rst
+++ b/Documentation/arch/openrisc/index.rst
@@ -18,3 +18,5 @@ OpenRISC Architecture
    =======
 
    * :ref:`genindex`
+
+.. alias:: openrisc/index
diff --git a/Documentation/arch/parisc/index.rst b/Documentation/arch/parisc/index.rst
index 240685751825..aaa708c7f98d 100644
--- a/Documentation/arch/parisc/index.rst
+++ b/Documentation/arch/parisc/index.rst
@@ -18,3 +18,5 @@ PA-RISC Architecture
    =======
 
    * :ref:`genindex`
+
+.. alias:: parisc/index
diff --git a/Documentation/arch/sh/index.rst b/Documentation/arch/sh/index.rst
index c64776738cf6..5a12d76abec4 100644
--- a/Documentation/arch/sh/index.rst
+++ b/Documentation/arch/sh/index.rst
@@ -54,3 +54,5 @@ Maple
 
 .. kernel-doc:: drivers/sh/maple/maple.c
    :export:
+
+.. alias:: sh/index
diff --git a/Documentation/arch/sparc/index.rst b/Documentation/arch/sparc/index.rst
index ae884224eec2..f2731a4925c3 100644
--- a/Documentation/arch/sparc/index.rst
+++ b/Documentation/arch/sparc/index.rst
@@ -11,3 +11,5 @@ Sparc Architecture
    oradax/oracle-dax
 
    features
+
+.. alias:: sparc/index
diff --git a/Documentation/arch/x86/index.rst b/Documentation/arch/x86/index.rst
index c73d133fd37c..2154bfe2b6ca 100644
--- a/Documentation/arch/x86/index.rst
+++ b/Documentation/arch/x86/index.rst
@@ -42,3 +42,5 @@ x86-specific Documentation
    features
    elf_auxvec
    xstate
+
+.. alias:: x86/index
diff --git a/Documentation/arch/x86/x86_64/index.rst b/Documentation/arch/x86/x86_64/index.rst
index a56070fc8e77..d4eb610b0080 100644
--- a/Documentation/arch/x86/x86_64/index.rst
+++ b/Documentation/arch/x86/x86_64/index.rst
@@ -15,3 +15,5 @@ x86_64 Support
    cpu-hotplug-spec
    machinecheck
    fsgs
+
+.. alias:: x86/x86_64/index
diff --git a/Documentation/arch/xtensa/index.rst b/Documentation/arch/xtensa/index.rst
index 69952446a9be..a794bddddad4 100644
--- a/Documentation/arch/xtensa/index.rst
+++ b/Documentation/arch/xtensa/index.rst
@@ -12,3 +12,5 @@ Xtensa Architecture
    mmu
 
    features
+
+.. alias:: xtensa/index
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 37314afd1ac8..068f85e5dd1f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -16,6 +16,7 @@ import sys
 import os
 import sphinx
 import shutil
+from importlib.util import find_spec
 
 # helper
 # ------
@@ -57,6 +58,14 @@ extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'maintainers_include', 'sphinx.ext.autosectionlabel',
               'kernel_abi', 'kernel_feat']
 
+extensions += ['alias'] # uses rediraffe
+
+if find_spec('sphinxext.rediraffe'):
+    extensions += ['sphinxext.rediraffe']
+    rediraffe_redirects = { }
+else:
+    print("Skipping redirects because sphinxext.rediraffe is not installed")
+
 if major >= 3:
     if (major > 3) or (minor > 0 or patch >= 2):
         # Sphinx c function parser is more pedantic with regards to type
diff --git a/Documentation/sphinx/alias.py b/Documentation/sphinx/alias.py
new file mode 100644
index 000000000000..e00605d07dbd
--- /dev/null
+++ b/Documentation/sphinx/alias.py
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+
+u"""
+    Directive `alias`
+    ~~~~~~~~~~~~~~~
+    Provides browser redirects for moved pages.
+
+    The directive declares previous path of a moved document as the argument.
+    Redirects are implemented with Sphinx extension rediraffe_redirects.
+
+    :copyright: Copyright 2023 Costa Shulyupin <costa.shul@redhat.com>
+    :license:   GPL Version 2, June 1991 see linux/COPYING for details.
+
+"""
+
+from docutils.parsers.rst import Directive
+import os
+
+
+class AliasDirective(Directive):
+    required_arguments = 1
+
+    def run(self):
+        env = self.state.document.settings.env
+        if 'rediraffe_redirects' not in env.config:
+            return []
+        env.config.rediraffe_redirects[self.arguments[0]] \
+            = os.path.relpath(self.state.document.current_source,
+                              env.srcdir)
+        return []
+
+
+def setup(app):
+    app.add_directive('alias', AliasDirective)
+    return { 'parallel_read_safe': False, 'parallel_write_safe': False }
diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 335b53df35e2..9ff99beb5ed3 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,3 +1,4 @@
 # jinja2>=3.1 is not compatible with Sphinx<4.0
 jinja2<3.1
 Sphinx==2.4.4
+rediraffe_redirects
-- 
2.40.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
