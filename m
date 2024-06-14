Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D8DC27C6E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Jun 2024 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TjlvY+XOk4T1zU1+cMSCwSTdBDmhuEd5KiAfgSjdJNA=; b=faQtVwzEjEBHG7
	z9a0Ak8usBno7miaKbCcguOpxP5lyUilP2oq9M5jFUMqALx5Hnau8OiQQlJ+1xDO2pkwH56+XnPNq
	mytJQuPjmz+CBQHRNrJQbNOIKgyi09uvIepRddIbI/EZQp9bx1kvzixlHgtHNUr013pgJSOB2h6Zd
	3c6eTfsomq5bTN6JTBRrXN7WE39vkPL3jeB0zrNODC+X4CTCEGw1/2AjrdzK+cby3PWP3a80ibbJC
	G4E4KuY1nINK/lLJ/AtbdYL8PSMXXrUzlBW9rrjBzv0Mf3kA0p8KZSXF0QOwEfRM7FnyGsp7O2k1t
	blz3gIk+K8fAMamIr19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sICHc-00000003r49-1LD7;
	Fri, 14 Jun 2024 19:08:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sICHZ-00000003r29-2oHo
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Jun 2024 19:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718392095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DwSn56t118gnsozrPMNHvwFUxMQgx5fcblRLcH107/8=;
	b=gTDgZxUjpiNMi60ugYw2Ku2w28A6hbgQsbxdR/cBVTo/M8q66R6p1V+cFFeXNKutx/H3cq
	VwMUKi5c7H+RcOuVxRhsRRcT2mmeFCPFU68fjI9yL80fOeO1g1voCAkA9/R8feIzdiEmNH
	Iff+01vl2JGopHqhL2AXtHfZjstl9cQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-cYgAlWJEON-cBqK9V1LgOw-1; Fri,
 14 Jun 2024 15:08:12 -0400
X-MC-Unique: cYgAlWJEON-cBqK9V1LgOw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFAC4195608C;
	Fri, 14 Jun 2024 19:08:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B3221955F2D;
	Fri, 14 Jun 2024 19:08:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] Documentation: Remove unused "nps_mtm_hs_ctr" from kernel-parameters.txt
Date: Fri, 14 Jun 2024 21:08:04 +0200
Message-ID: <20240614190804.602970-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_120818_159212_7047A593 
X-CRM114-Status: UNSURE (   7.72  )
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

The "nps_mtm_hs_ctr" parameter has been removed in commit dd7c7ab01a04
("ARC: [plat-eznps]: Drop support for EZChip NPS platform"). Remove it
from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dd8436c98735..f58001338860 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4143,15 +4143,6 @@
 			parameter, xsave area per process might occupy more
 			memory on xsaves enabled systems.
 
-	nps_mtm_hs_ctr=	[KNL,ARC]
-			This parameter sets the maximum duration, in
-			cycles, each HW thread of the CTOP can run
-			without interruptions, before HW switches it.
-			The actual maximum duration is 16 times this
-			parameter's value.
-			Format: integer between 1 and 255
-			Default: 255
-
 	nptcg=		[IA-64] Override max number of concurrent global TLB
 			purges which is reported from either PAL_VM_SUMMARY or
 			SAL PALO.
-- 
2.45.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
