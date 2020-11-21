Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE03C56202
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1957C2158C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxBOZUkK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZsJZYbHj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="wOH9ZHxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1957C2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TP3+Cu/+BqTxOf7N7s4f2u+f0uWqnFqMDBXyd3QT114=; b=dxBOZUkKa07D+SK4ofHdlDaThk
	Ir2v+Tx78R9zfCM4NV/7cetn2pkCWv4GR5SQmAGZYXbKiRV3oieXORPEYoGjxPR+DJ8HedYarhNIV
	n4vJWA68tWoAw3SeI7Mx0aUKqlKN4XgVdMvyN9RvJ2UCGamjWQ3TSq8dSkhVOqhH40VAYU1XEzQBM
	NlCB0vLzSAjpj5xS1EnUSsD4go0b2QmImsxPegESm/2jzTU2o/aPqPFv5Ku13F04R8J18DjXb6wA5
	98smGhjIP7+je/S8n1ZFLYNx7OKCi72xPy9B9vyTnIf94t19/t0kKVsj7eTStQttD/O3TwUYtekQo
	hYdppJZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjr-0005f7-M4; Sat, 21 Nov 2020 22:52:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjp-0005eT-3y
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 22:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=GqoLNdoBKH71HuPfIdb3wMMQhGxLSlKNiwT62cmDdxc=; b=ZsJZYbHjgMppLeo1QxmQKeJbTx
 xoA1pX0LeLmXZH2XPPqJj1nUrbtZ6xIPvOwlZXT3chJg/0kxO0tTaSIsjFYVD5606vxhriH4U88m/
 mkPk3l9U5p7aWJkjy4PwU8WikL4HinKh8P6BqjIbPoEuegCA//59KqtB5IGU6cYqoJNjldXMuFVt2
 7lp5wHQTMaslU+sGZpDJbSE9sACleN+s8Grx2+QQ/RYa4y2jQrFu6qo8HtbAZAy+TF1LivaKZKSxa
 PMuykCD50xrnafRJDtt4L4muLDJ5OsiLyXI742xW/G4uhzXEDhLklxQBRWZ6pzKfYstlo+e6/R3dq
 6TGKdahg==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhl-0002Wq-WA
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:37:58 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZB029948;
 Sun, 22 Nov 2020 04:36:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZB029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987419;
 bh=GqoLNdoBKH71HuPfIdb3wMMQhGxLSlKNiwT62cmDdxc=;
 h=From:To:Cc:Subject:Date:From;
 b=wOH9ZHxBUKlGAnVCDOwBKig6qJ69ARviC7/Hx/GJyiQD70QEQ+6ntuoP9pWCPgtVJ
 XuETkrYRxd1Fy8tK9vnHpTVUN4DBG1xugCxQvhrTYHOWuRcRUfD26q49eN7CsD/Qy5
 PIH+bfqjQCru1/XM1z0k2h3Yc11wWkmqXVDAGlrDAhsSKwnT+5Htn2qvhdn53GIZUx
 dA9WQBh2G4KM92yKDAYaIpDyeimgRCKGm2AES78kFolyVYitGERsfgYrcnvorvmdQl
 PMW5YtZDktYFKiVaTfVUxkiwwPXVNMPpedS+X3J+TGKEdSVN6Xy1ij7Y8MsaEqWyiv
 z7AeOfVk4jfmQ==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 0/6] ARC: build: fix various issues in arc boot Makefile
Date: Sun, 22 Nov 2020 04:36:51 +0900
Message-Id: <20201121193657.51441-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_839575_AC997C75 
X-CRM114-Status: UNSURE (   4.66  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org




Masahiro Yamada (6):
  ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
  ARC: build: add uImage.lzma to the top-level target
  ARC: build: add boot_targets to PHONY
  ARC: build: move symlink creation to arch/arc/Makefile to avoid race
  ARC: build: remove unneeded extra-y
  ARC: build: use $(READELF) instead of hard-coded readelf

 arch/arc/Makefile      | 20 +++++++++++++-------
 arch/arc/boot/Makefile | 18 ++++--------------
 2 files changed, 17 insertions(+), 21 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
