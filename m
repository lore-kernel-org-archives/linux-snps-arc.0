Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724960A261C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pde4pPMa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Af8BNbt6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ihQvoWZgf5v5oS+EvztzneTw92lr25ZZAcl+WB4OUIg=; b=pde4pPMao1TprX64zwMELYHI9V
	hPt/JDUT+jBwxe881T8RYE6W6FlUvvZ4d6cb24U8kk/a8Tx+NEvATaJZl+7ZV7DGIdOEJSeDAYqHG
	J6dzctQX50oa+1minIRRdQRBBZzGwKnCwnTj9ZyM2WnJkAn57BMrFshHX7jZ17VYZTxo19vCwnGtw
	PW0RVZJxYhCV/lPE/tPluKRsk9n8X7CGXTi8YKc1IYy4YJTZAThSHbMcMBzJQ8ryMF0BfC4ar6hQH
	zTWR22AsBq1aMevLXQz2rKcDDNnG4tGUe/lSasqqNzw6jfpy/9ZbcP3Wr5k6tWroz7gZd5DliSwxk
	ELk7Xtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBl-0000000AxKM-0pzk;
	Thu, 19 Nov 2026 06:00:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBj-0000000AxJW-3p9b
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 414644576A;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC071F000C4;
	Thu, 19 Nov 2026 06:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068003;
	bh=wgP7/UL6Bd9Sg/Oh5ftSdA1lXlTal01x5XIHbl6l9Lg=;
	h=From:To:Cc:Subject:Date;
	b=Af8BNbt6+UKEsFJ3TNjaaKjs4g4Fdt/0/oQjsUYOR35IgW5qklZYNp2SwxM9vM5mv
	 zxVU5wCwfV0nOs6tfzkbVYzfxUX+K1aYwj1XRrYx8sjFMfLorjFuvX5J1aw9OfPBDx
	 sZ5MLLC0VGNijp54p4XWlBH0cyDSAsBrM+pbONC0k65fRWZneY4LFTeYIP9ZOiaFbB
	 zNtwfhyOM+6B6tCRox+LmH763LrxQGs+0pF4JtIHhHPZ3HFE8sLocr5Nxceqii0Pn3
	 HM5OFzuD3PnJ+9ZceWOjGL54BOdM0w9kJgj8Ui0sIoZnq1ZaZdTs6nlFp+DlLHyJmd
	 uHpIg2AmQ1O8w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/4] Remove libgcc dependency for ARC
Date: Wed, 18 Nov 2026 21:59:54 -0800
Message-ID: <20261119055958.1621709-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Arnd pestered me to do this.

Most of the generic emulation routines were present in lib/ flready.
Thanks to Dinh Nguyen and Simon Schuster for filling in the rest.

Thx,
-Vineet

Vineet Gupta (4):
  ARC: math emul: elide 64/64 divide and floating point routines
  ARC: math emul: use existing lib versions of libgcc routines
  Revert "ARC: Strip libgcc debug information when generating BTF"
  ARC: stop linking libgcc

 arch/arc/Kconfig           | 10 ++++++++++
 arch/arc/Makefile          |  9 ---------
 arch/arc/kernel/arcksyms.c | 37 -------------------------------------
 arch/arc/lib/Makefile      |  8 --------
 4 files changed, 10 insertions(+), 54 deletions(-)

-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
