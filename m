Return-Path: <SRS0=vqj4=Y5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF6BC5DF60
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 19:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B125521928
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2019 19:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxr4AY90";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WkBK5neP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B125521928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFXszrh+QE5y0jcFwEYuib5nmeojoV6Ki1IiMnw8hec=; b=hxr4AY905gUGD1
	+QkQk5I0aOkjHyUvuphkN/ERnpMmD5O388dZ+1ZwJiwgphMHjZjS6XlSY7yUtQyz2feTL7S47KfZz
	A7HpRMTwnT0Ae3iEjfuDiD0+cBAqkg3SV1wDoTwpjMVY7s4Uo0ESSU1b1NAZpt8clzR/M5MWIZZgi
	AvFTct+beCM/5CZjhtJGddUI9gLw3nBLa9uzgl9lrqpo18FtEi2d1MI3dhGIChNi4tII60fD7dhBw
	LM1GmHwwyb+Daomna9a/5g5eKVtj+EIj6vlsnbaUxcn8uAUhzb9s7j68c+wGVXimUN+ropI/VWR6m
	C3HP6Ws3S2h0c7TEJhOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS4M8-0000a5-UG; Tue, 05 Nov 2019 19:19:08 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS4M5-0000ZN-Q9
 for linux-snps-arc@lists.infradead.org; Tue, 05 Nov 2019 19:19:07 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 69D5AC04F8;
 Tue,  5 Nov 2019 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1572981544; bh=onK0OZMlc+LU0dpVwy6clrf4wF3qcFkIMLUb8zogCkI=;
 h=From:To:Cc:Subject:Date:From;
 b=WkBK5nePlHDXc6C2DAJApcDnkdfhKCQV30ToG/68KrL3Kv/geVUBNBWAZxt6q2rOM
 ZRY33FF6aW47elD492HHDav7cd9aCiqFaznQ4fByTFKS0LgiMsaviUAO0WrtzLimCJ
 zJ7VgKBGjxhD/jIhMs4zvX6ovxiONOi1Tieh4R3jEaSWqY/gX5YxIdji3UU3qiD2lf
 /cVpAkR1biGQFoNGy2wCL1mGplTAvtjXtuF0yRf4ZhHMPD/5T036SSacSkKbAkum1V
 UEE6hZ3Bg7Lfnf017LZBMHRImZw1WK8bMx1lZsqAWVY1Jz5rw4MiovKpcPyCw3WMVJ
 9gNQDrzjCCsPw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 64F7BA00C6;
 Tue,  5 Nov 2019 19:19:03 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: gcc-patches@gcc.gnu.org
Subject: [PATCH] [ARC] Add builtins for identifying floating point support
Date: Tue,  5 Nov 2019 11:18:56 -0800
Message-Id: <20191105191856.14652-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_111905_890050_B6D8B737 
X-CRM114-Status: UNSURE (   7.81  )
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
 linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Currently for hard float we need to check for
 __ARC_FPU_SP__ || __ARC_FPU_DP__ and for soft float inverse of that.
So define single convenience macros for either cases

gcc/
xxxx-xx-xx  Vineet Gupta  <vgupta@synopsyscom>

	* config/arc/arc-c.c (arc_cpu_cpp_builtins): Add
          __arc_hard_float__, __ARC_HARD_FLOAT__,
          __arc_soft_float__, __ARC_SOFT_FLOAT__

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 gcc/ChangeLog          |  6 ++++++
 gcc/config/arc/arc-c.c | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/gcc/ChangeLog b/gcc/ChangeLog
index f3deffc701ff..9237e81aa011 100644
--- a/gcc/ChangeLog
+++ b/gcc/ChangeLog
@@ -1,3 +1,9 @@
+2019-11-05  Vineet Gupta  <vgupta@synopsys.com>
+
+	* config/arc/arc-c.c (arc_cpu_cpp_builtins) : Add
+	__arc_hard_float__, __ARC_HARD_FLOAT__,
+	__arc_soft_float__, __ARC_SOFT_FLOAT__
+
 2019-11-05  Martin Sebor  <msebor@redhat.com>
 
 	PR middle-end/92333
diff --git a/gcc/config/arc/arc-c.c b/gcc/config/arc/arc-c.c
index cf3340d29c27..1a5ff3e88a67 100644
--- a/gcc/config/arc/arc-c.c
+++ b/gcc/config/arc/arc-c.c
@@ -71,4 +71,14 @@ arc_cpu_cpp_builtins (cpp_reader * pfile)
   if (TARGET_BIG_ENDIAN)
     builtin_define ("__big_endian__");
 
+  if (TARGET_HARD_FLOAT)
+    {
+      builtin_define ("__arc_hard_float__");
+      builtin_define ("__ARC_HARD_FLOAT__");
+    }
+  else
+    {
+      builtin_define ("__arc_soft_float__");
+      builtin_define ("__ARC_SOFT_FLOAT__");
+    }
 }
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
