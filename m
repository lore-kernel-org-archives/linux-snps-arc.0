Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36333C433EB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068642077D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XTIz9DyO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GGIGIL3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068642077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hRv3nTXFiziqqtc/GaVl/iQ0pmY/lBwQSf4fObMD0GE=; b=XTIz9DyO0Niudkj9SwSfXcHV1
	9qYlE5+RRrNabsWzHUOvI41PCDsb8FstfZ2fe8Q4lJ/VZsVmALAvEiRlxhVu2tcU/n11j5UoWYoKt
	iZ99hIIkfbHMtsADbKG9vHC/TUQ5HisVkFOE1UKVACBGn37QsdNASBQeY0F5kdB0+LwprQMvGXtlB
	6T7vQllleYUCzYrVB6PgziVG4Ky6Sl6WBZv23silqvr2bE9lKAsCXCj1TM9DzyUFzxBgM2z0ErzZs
	SwW/WN/YOYXQcz76oMSG1NFdp7uC9IvLwr/B73wLU9QCi2y1J61GDvj4FchwcPhNeltVeb9rCZS9g
	uP4ppO13g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju2b8-0008F3-6N; Fri, 10 Jul 2020 23:38:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju2av-0008Ae-Qw
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 23:38:27 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4355840A3D;
 Fri, 10 Jul 2020 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594424297; bh=dINe2mpRicPjt7+CX8/HvjV+sMCmYuN/6PEIe+m5MBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GGIGIL3O0v7dXDpyQ7CmMEzdQSjlBWK0F9t9pK/pYq0n58BuoojFEw9XtYSPyrQzQ
 vPmup7Hz8waX0/PKUsVDXyAnQKcdSA3bTz5U60ns8PefqsNEG86NZCkJO95CAiz2nk
 SSvoF84IBn9KNrQ6RoMtgUbPsASdlnqiZgAK5pz1VpXvi1UFtBOYDQuSd4vQcT8Jpf
 BXEPfKeeH6ydPHai2QMWPz3ATtM56Y0o0XbVSnr9mw1SKkKCVBLOJgHOK3t0lxwwq+
 yyXtAk8ggGACPYcAZkyckEi+xF41ny/kXiJn9bWudNxSGusxQpMOaPtNTGR46o0Yjt
 niwyMR8wO8qIQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 07C26A005A;
 Fri, 10 Jul 2020 23:38:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [COMMITTED 12/13] build-many-glibcs.py: Enable ARC builds
Date: Fri, 10 Jul 2020 16:38:09 -0700
Message-Id: <20200710233810.18720-12-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710233810.18720-1-vgupta@synopsys.com>
References: <20200710233810.18720-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_193817_947627_4E6E4614 
X-CRM114-Status: UNSURE (   6.03  )
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
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 scripts/build-many-glibcs.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
index dfaaf50a192c..00ba6f6b1193 100755
--- a/scripts/build-many-glibcs.py
+++ b/scripts/build-many-glibcs.py
@@ -162,6 +162,15 @@ class Context(object):
                                        'cfg': ['--disable-multi-arch']}])
         self.add_config(arch='aarch64_be',
                         os_name='linux-gnu')
+        self.add_config(arch='arc',
+                        os_name='linux-gnu',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38'])
+        self.add_config(arch='arc',
+                        os_name='linux-gnuhf',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38_linux'])
+        self.add_config(arch='arceb',
+                        os_name='linux-gnu',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=hs38'])
         self.add_config(arch='alpha',
                         os_name='linux-gnu')
         self.add_config(arch='arm',
@@ -1221,6 +1230,7 @@ def install_linux_headers(policy, cmdlist):
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
