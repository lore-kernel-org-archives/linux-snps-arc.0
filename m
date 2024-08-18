Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E1C52D7C
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Aug 2024 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NHEbBeF+S41vGulveV4LWNn1JtqtxVaUgBAooA1xcw=; b=CMl2FfKfQfLmJq
	GeFI9zApCdOy01edQ6QBMavBsJZs7zsyXEVA+CYC/LA8vVhMJODzvQvISJxDPKjIocAcC4oOIXmIC
	8l2OMRQAvDNovSMG/vMdRM7vrnj0/JJiGreRpjBFqQDqBQJkPRoB80x2hn5VnkLnFdPrsuRObmV/k
	VMOK7k2THg4f5/KFN1ghutMtYgVxegbNaWcqH3zLDslYjTQP7ehHJuQU9xZ0FlgaolXgH3ww/S7Xn
	CNSxvEoDNlhfdRMaF85DpfhcHLBTLDR7G0+Uh/gMFSsrYV28YEF0coLKX8QqYVC6n2u3w1BcDYELv
	yxabuGy1gMq2GGNL9RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiVs-0000000GnwI-11b6;
	Sun, 18 Aug 2024 16:12:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiVp-0000000Gnvx-2iZ5
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Aug 2024 16:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D71D5CE0171;
	Sun, 18 Aug 2024 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AFDC32786;
	Sun, 18 Aug 2024 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997530;
	bh=ruS7y2wKnEPgI7gkRFDbH9dgOjAhSQz1+QJFBGsSogg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5v1diRXjN5kVoybKiTRPIY9aA1UEswchRcP7JWhmjuTH30Uxt/N6e4vImG9MKyi4
	 6bmE2jh2SZ7vn8Rc14BnpHiGM9+6lYeiRZCNJ2CBp9iYQv7LHx4AN6pnEyKkHgw67o
	 KXP16ARCwLB2ZLP39z4dnWHFcbBnBdCIH0d3oz5IJyRqNfVMAStsl4Z6GChM/R36+/
	 c+XRGsJy1IM/v38lc4EfUxHgcXc+dQmjo8V0hRu7abz+Rdx4gJ1U1EDogbnTxF1gFD
	 u+LM+xIPcSZAgsvw9duok9IoCB+1CIBkT1u7slJWeUIPeANwBtM1COkq8JFSEt3H1Q
	 3FGE6dADp0d+Q==
Date: Sun, 18 Aug 2024 10:12:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	krzk+dt@kernel.org, vgupta@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [RFC PATCH] dt-bindings: arc: convert archs-pct.txt to yaml
Message-ID: <172399743227.172916.628419421629636564.robh@kernel.org>
References: <emosjjbdwimwevrf2ew2dpn5sdx254el5fanhhquouu4bz6nbe@zqyp5ra7bmhh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <emosjjbdwimwevrf2ew2dpn5sdx254el5fanhhquouu4bz6nbe@zqyp5ra7bmhh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_091213_879138_5754AF81 
X-CRM114-Status: UNSURE (   7.16  )
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


On Sat, 17 Aug 2024 08:56:29 +0530, Aryabhatta Dey wrote:
> Convert dt-binding archs-pct from txt to yaml format.
> 
> Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
> ---
>  .../devicetree/bindings/arc/archs-pct.txt     | 17 ----------
>  .../bindings/arc/snps,archs-pct.yaml          | 33 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arc/archs-pct.txt
>  create mode 100644 Documentation/devicetree/bindings/arc/snps,archs-pct.yaml
> 

Applied, thanks!

However, if you are going to do more conversions, please pick ones more 
widely used first as Krzysztof pointed out.

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
