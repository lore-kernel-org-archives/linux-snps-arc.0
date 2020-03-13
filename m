Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F65DC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCAB1206F7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HY4nijHG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dMh3xh3N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCAB1206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5Oa5w8VQoexFN4EqEngQJSO0UtiW0vbtUK0kYFLRHQ=; b=HY4nijHGjuwLXa
	cgJP8cc6xGOYh07+IX6JAPfknxpuXdOT1quERP/aXHk73CEIrufkK6WLZmnIMveSHQaZ9G+mMjpf+
	N3x4KzQQuIa+gosjQAiZ+L1odeBG2rk1hunnIacayuxzx1Z7/07yoYDMve0yJNrWjp2jacRELT8QC
	y6Bh/R5cL3HT9VmrXd2eZGk7nHgUtaf37zXdd7B7DwJfCsmL0qck5U+1L75R6qM2aEE1+F/iYEAKa
	bcryF4m2zDAZAAEmjBw4ZRmhet3w4WdVuaDePoup4/AjvCpPixN/DVb63WDIY2LXL1Yv7Qqs1ytCA
	Dkld8qqrCL74YeXTYe2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCacx-0003d1-3u; Fri, 13 Mar 2020 03:04:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCaci-0003UK-QO
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:44 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7DEF402A6;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068672; bh=ihQ1698NNIVP41Yi1yz+GD4LkKgoWQY3B6kXKGGmPLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dMh3xh3NA0HcSgiMxQRrvYlFETzUaFGqgQFbXK+AGSK3LZUZANqMhZvOg2dihxg3n
 9sZExq3RuhWtbu4QlbYqDLNWnmcNTsK/qfTX6+Bha7UwVjV8K5Kl3/Y089OUEl9f2/
 sQk5cGUC+XNsH/WOmEGzYkn1yfvnTr2fgrz22FQIOA+6DGLrK+9EiuMNzPmiDMRIY+
 vYdusqr7+GRFsSyKoQKEQ1RLDCnrd+UuxFvrJIKxAjVhHVPu+RuC6D4bmbYHel6iXN
 nisdF7WHeb88sv8RPNmQ8ubP199NYXvMcgmH+bdW02B76q2ev6IwO01/MrYbnajwxc
 1sk1SlCph2jtg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7AFA7A0080;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 14/15] build-many-glibcs.py: Enable ARC builds
Date: Thu, 12 Mar 2020 20:04:18 -0700
Message-Id: <20200313030419.15843-15-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313030419.15843-1-vgupta@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_200432_867198_5BAD729B 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 scripts/build-many-glibcs.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
index 0f6c4a5e3a08..011a30494e1a 100755
--- a/scripts/build-many-glibcs.py
+++ b/scripts/build-many-glibcs.py
@@ -162,6 +162,12 @@ class Context(object):
                                        'cfg': ['--disable-multi-arch']}])
         self.add_config(arch='aarch64_be',
                         os_name='linux-gnu')
+        self.add_config(arch='arc',
+                        os_name='linux-gnu',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38'])
+        self.add_config(arch='arc',
+                        os_name='linux-gnuhf',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38_linux'])
         self.add_config(arch='alpha',
                         os_name='linux-gnu')
         self.add_config(arch='arm',
@@ -1239,6 +1245,7 @@ def install_linux_headers(policy, cmdlist):
     """Install Linux kernel headers."""
     arch_map = {'aarch64': 'arm64',
                 'alpha': 'alpha',
+                'arc': 'arc',
                 'arm': 'arm',
                 'csky': 'csky',
                 'hppa': 'parisc',
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
