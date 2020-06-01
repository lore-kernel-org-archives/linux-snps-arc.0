Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4182EC433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 22:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F452076B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 22:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="estnoi/t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c2Eq12Nz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F452076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Co/SvwnW+i6CyOaP6F5W/98hX55LOjfSFeRHZ/kB7ns=; b=estnoi/tsnVraf
	cKGIvgrtyIxSNQhON4TTjsaM04HwIuMRCS2Dl5gTbxWOhRGDnBlgQRXumt/zc3iYDWOd41o+mVwQD
	DL+GLkiQrfXBTG6tpkpckaCwz8HzaEjXt8LsuXr2kkkH2TnNJbnGMrGbzLbavdr5xLnri6hJwC9EE
	wZ0UxxrFPBhxoaw/ht/oV2Z7V9WQA0lwcAmymjGfpJa14Tm8bKX6altDvSbYKaAReNmARoE2Ovly9
	oJOfUVdgRUJ1CALH496Btb7DznnuOW2FHFg06aUdk4X28kFi6nO/oMdtqfvIFKIRyUbr+exEd1pzK
	VN+MSdXjGCFXqHtTasBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfslP-0004ID-UA; Mon, 01 Jun 2020 22:18:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfslN-0004H6-7l
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 22:18:34 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B241A401AA;
 Mon,  1 Jun 2020 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591049912; bh=8c8TVcatNexrT8oALkq2vn8LVC3OoT0MQr7SGaPuX+o=;
 h=From:To:Cc:Subject:Date:From;
 b=c2Eq12NzWo4PX1ao7PVdCYhEmTHTj4yDSM2e8VeNPu6Oq3IXg7z7BfcRGil8dOS/C
 FAk7ozgYZWPBVbJYxJZzMEphLk4WU3tdtv2GlcQSWqNNzaxEgtuootY3V0TokRGzyz
 1cutjGg5NvPR4IuWUgdaBOybEFWwwtB+7buzJUt4t6v6kvsFw1DaHIIWA+DpyyAPJS
 fv48oOdACMBa0H3nSKKn12ZUYYIP4nPPVaW5IjaEgREKo+ovPZGPP2BWUZU7t2wv1W
 lY6HEqZjBrTEyLm3lLGP94O7QkCVz8m7s2ba3OO67EesV6OTQCriFy4dfKRTGM5OFB
 qECWCBWklXSNw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 53B72A009A;
 Mon,  1 Jun 2020 22:18:29 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v2 0/2] rework dl-runtime: reloc_{offset,index}
Date: Mon,  1 Jun 2020 15:18:21 -0700
Message-Id: <20200601221823.17861-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_151833_285766_E1CCCFC6 
X-CRM114-Status: UNSURE (   7.17  )
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

Vineet Gupta (2):
  dl-runtime: reloc_{offset,index} now functions arch overide'able
  ARC/dl-runtime helper macros

 elf/dl-runtime.c            | 28 +++++++++++++++----------
 elf/dl-runtime.h            | 30 ++++++++++++++++++++++++++
 sysdeps/arc/dl-runtime.h    | 42 +++++++++++++++++++++++++++++++++++++
 sysdeps/hppa/dl-runtime.c   |  4 ----
 sysdeps/hppa/dl-runtime.h   | 31 +++++++++++++++++++++++++++
 sysdeps/x86_64/dl-runtime.c |  9 --------
 sysdeps/x86_64/dl-runtime.h | 35 +++++++++++++++++++++++++++++++
 7 files changed, 155 insertions(+), 24 deletions(-)
 create mode 100644 elf/dl-runtime.h
 create mode 100644 sysdeps/arc/dl-runtime.h
 create mode 100644 sysdeps/hppa/dl-runtime.h
 delete mode 100644 sysdeps/x86_64/dl-runtime.c
 create mode 100644 sysdeps/x86_64/dl-runtime.h

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
