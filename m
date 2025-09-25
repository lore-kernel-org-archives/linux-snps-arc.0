Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D614DCAC5AA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Sep 2025 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ayIs0Xf0Xv5ALbl+kyfnIJ3NyLO7NS0WnC1cMNG4Y8=; b=KKX+woD4ySQGyn
	tgSqfzpahEf7OwiIF+hzaj4uvn17k0evqsN1Ate2sjYJ3UumrFnJwJTPvZCW2Eay5W6SLO3lZGU9P
	w/MgrYJ85FL/LR2nRLuyq7D2Lb+FYbngvnV8W+GHq0o+Bf7Tack1lKj3YbFNOjWspSBBCseQEZsBT
	VyhjnUq8ebEzp+5yXA3mmQuiCWQXrk8JbE5CLd6tl78GsSwat5GjpQsfw/XT4yD0FJ1q3+4POxBGi
	rx1fgT9Cwid/z/ICKZFHON7izQU4tc2aFY71dGymfmUeFv0AvFZvhIuC4y5OnKoOxcrOxNwIMAc0i
	94PSb/DLMOFfocRyE4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gXF-00000006m0B-2bk6;
	Thu, 25 Sep 2025 07:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gXE-00000006lyo-0BIr
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 25 Sep 2025 07:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=; b=LwBPfXPFOTgR90iEielrpICfUt
	+Y+YeOa+wZww6aVyKxmVnPwn2REKIOSbOn3BfHsV+/lvRzdqvcdCh4NkyglD1QMeFzI/C6FLyKijK
	NM5bP+rNtPCIHampXZTIqVTRj0gbqaeuZirOCmKOgEwQacErxZsdDtRaa1337sCqjgiCXDfu9Q/Nq
	yQ7Wqx+jyAJNlfxb50YIITWLhQ4cxM1/TrJpwa90eZHSam27xx5O2y50IgV8RFHJfSNZkc4FaY8YG
	Ijf8PBIJUB/4acjeedDoo5jmdla7LywriQ+QoNVwhQ5sQ08rgRQ0fFsZMgGIBqA2NzvyRaeEx+HiB
	+OJkdEtg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gX9-00000008vqD-3isp
	for linux-snps-arc@lists.infradead.org;
	Thu, 25 Sep 2025 07:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758785805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=;
	b=b1mZXmJqd9LD7GcxektdNnkcPR/0yqRDdt7jHAkIdk+pg12hhOWgOKCN8X70F4lFEJsTfD
	hneAK8y53S54fNItDQb8hj0iHtO+0vFsuiDihvUFhMm9Q56r+pU2EDA2w820xzD7yDXbvB
	1YJLillQR2u47uRh25/cDeN1SgWpmGY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758785812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=;
	b=K9Q666qFi1WC8sh1qMAnweS//nUxq6skNdIq/06iX/sz5cvL6AyTzBWWHpysppYEngSipP
	dYjw5gMkZYp2IO8kEkdNBJynEjn2Tbd0KjTk1ZAScIDA0onkHJqWChcWwQb3/ZS1QEHb9X
	tUNqohJhsZy9uLStERZWgRkp9chZaBU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-onOzD81qN-WoTK_0LZ5PzA-1; Thu, 25 Sep 2025 03:36:43 -0400
X-MC-Unique: onOzD81qN-WoTK_0LZ5PzA-1
X-Mimecast-MFC-AGG-ID: onOzD81qN-WoTK_0LZ5PzA_1758785802
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e2c11b94cso3521115e9.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 25 Sep 2025 00:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785802; x=1759390602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4NmZHUoJps7Yrk11w5SBou2tcMbfSFRbEHR6+6/r24=;
        b=jNCTND6eBZaQ4BEfAqJzHizjQ6op8B6a1IQtMag9FaEUPl+G49TQ3KlOGBVEQfqNZG
         7JCerLgvYO1nGs94Fn4+7n+uQgp6Z0Hgb1CYYPCavQVjbAK5u7ukMnwU84mjAarcrmwH
         BhLn1J42rkMth4FLBy70TD3ugm1QMkMbPlz9En4frx+sO+QB/a+QFMeGdOFxqT79GzmB
         5u+Ggz8BicHzio7fbQL4fhQXnLP+saFY7ymPQwYmbYlLVNEv6Po93AZAvBPZk9IaO+pI
         bFRbmb0Z8Ca/kX97Cqsy1qCcQQltbXEVMUVt2gk7uJuZ9mbceg92cYg2WB1oyX5b8N/W
         +kIQ==
X-Gm-Message-State: AOJu0Yxz+h6fqirEv4lMuWYD7QO0DkFsMWPO+QnzFk09q60DVzeprjDt
	XeBFe0MdU+RMr6m8HGUQSxYaJTRkQOqerzXz0fRwi1jZWFzqHvIqJq6/S3W6GYpeaCc6JxIivmB
	+0YvuqGe5sWZidrlmScYjeYPmjeOPHZ9oXnYLD0SHb5Vs4yCA/tEUyMiuUVHVc5UNx0dmpgscPB
	3FyCJJeQ==
X-Gm-Gg: ASbGncvMqySoklwQporzrWOraPVs7L9RpZ1CkVavQ/muvvmPnkcvYArYwL0TEJfI2oQ
	5968iSN0ekzl/Li4lrBAUUS2R8kBqeqz7ynmM6rSy/bPLmX4kOJCYYCkCC5gyptHi61dwqyKlxg
	lSNOue1OR2euaEtWBCOGalhfbSMcJDV/2nzQCvKJTitFR0XCEy6e9IlK2oVXBl/ecywNpu7mBxk
	la006IusMiceueU+0+Hq0PLzx7BOlk/TpOY27TWhJwS82rd2+TZQSj19dzfYt0yPcvVaLgk447N
	1rHSSdRxxRcfM5SDwXuWuKJNKBbtqLjXbo3/4MRjZVz7o6QRHeljHOpuxIn173dl7gg8BzzpkTc
	nLSndC0ZovJ1UHg==
X-Received: by 2002:a05:600c:8010:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-46e329a805amr24229705e9.5.1758785801760;
        Thu, 25 Sep 2025 00:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHigtd7Rlw0EkwZsZ6TnPLHr+fIfHQKJS55XMc7sCab7310hvvOcbsSwYh9WPs1s1S/Xj6xjA==
X-Received: by 2002:a05:600c:8010:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-46e329a805amr24229265e9.5.1758785801231;
        Thu, 25 Sep 2025 00:36:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc560338csm1755120f8f.41.2025.09.25.00.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:36:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-openrisc@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Documentation/features: Update feature lists for 6.17-rc7
Date: Thu, 25 Sep 2025 09:36:34 +0200
Message-ID: <20250925073634.112142-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8OPAX7QegQc7ytKRHwXdosDt0RQJ8yOp11eDZKXK73Q_1758785802
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_083656_406421_2C5360C1 
X-CRM114-Status: GOOD (  14.94  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

It seems that ./Documentation/features/scripts/features-refresh.sh was most
recently used in December 2022, with the latest kernel release v6.1-rc7 at
that time (see commit 7f2e60ff51ca ("Documentation/features: Update feature
lists for 6.1") to update the feature lists in this subdirectory. All
further changes to Documentation/features/ since then have probably been
done manually, without checking for changes in other architectures and
features, that missed to update this part of the documentation.

Running ./Documentation/features/scripts/features-refresh.sh now showed
seven changes of supported features in various architectures (one in arc,
two in parisc, one in riscv, one in openrisc, and two in um), which were
not reflected yet in the current documentation.

To confirm the sanity of this script's suggested changes, I checked if the
commit messages confirm that the features have in fact been added in the
following commits:

  - commit f122668ddcce ("ARC: Add eBPF JIT support")
  - commit 4800a6215e33 ("parisc: Wire up eBPF JIT compiler")
  - commit a869b8c29f86 ("riscv: enable mseal sysmap for RV64")
  - commit 2f681ba4b352 ("um: move thread info into task")
  - commit 3f17fed21491 ("um: switch to regset API and depend on XSTATE")
  - commit 7ce8716e2769 ("openrisc: Add HAVE_REGS_AND_STACK_ACCESS_API support")
  - commit b5ff52be8913 ("parisc: Convert to generic clockevents")

So, update all documents to the current state with features-refresh.sh.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/features/core/eBPF-JIT/arch-support.txt         | 4 ++--
 .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
 .../features/core/thread-info-in-task/arch-support.txt        | 2 +-
 Documentation/features/core/tracehook/arch-support.txt        | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
 Documentation/features/time/clockevents/arch-support.txt      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
index 7434b43c2ff8..83f77f55fc87 100644
--- a/Documentation/features/core/eBPF-JIT/arch-support.txt
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -7,7 +7,7 @@
     |         arch |status|
     -----------------------
     |       alpha: | TODO |
-    |         arc: | TODO |
+    |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |        csky: | TODO |
@@ -18,7 +18,7 @@
     |        mips: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
index a3c24233eb9b..fa85381acc43 100644
--- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
+++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: |  N/A |
     |      parisc: | TODO |
     |     powerpc: | TODO |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  N/A |
     |       sparc: | TODO |
diff --git a/Documentation/features/core/thread-info-in-task/arch-support.txt b/Documentation/features/core/thread-info-in-task/arch-support.txt
index 2afeb6bf6e64..f3d744c76061 100644
--- a/Documentation/features/core/thread-info-in-task/arch-support.txt
+++ b/Documentation/features/core/thread-info-in-task/arch-support.txt
@@ -24,7 +24,7 @@
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
-    |          um: | TODO |
+    |          um: |  ok  |
     |         x86: |  ok  |
     |      xtensa: | TODO |
     -----------------------
diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index a72330e25542..4f36fcbfb6d5 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -24,7 +24,7 @@
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-    |          um: | TODO |
+    |          um: |  ok  |
     |         x86: |  ok  |
     |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index 713a69fcd697..75c05d348c01 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -17,7 +17,7 @@
     |  microblaze: | TODO |
     |        mips: |  ok  |
     |       nios2: | TODO |
-    |    openrisc: | TODO |
+    |    openrisc: |  ok  |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
diff --git a/Documentation/features/time/clockevents/arch-support.txt b/Documentation/features/time/clockevents/arch-support.txt
index 4d4bfac52970..d6100b226de5 100644
--- a/Documentation/features/time/clockevents/arch-support.txt
+++ b/Documentation/features/time/clockevents/arch-support.txt
@@ -18,7 +18,7 @@
     |        mips: |  ok  |
     |       nios2: |  ok  |
     |    openrisc: |  ok  |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
-- 
2.51.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
