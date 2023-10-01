Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED1E748E9
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Oct 2023 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4HUCHoe4MchoAJBhbQjstMFF+J2ewnH3t2Y3BSjOIo=; b=shViVfRbkeY+Gz
	P15k5tNoVivpEBpyLYPypsnyt+B/56690ucD7FqHaRCmMxUSO2IPUyTOh/BpNjawu9LI4wRwRfUMG
	J7Q5+PkU3WzrIew0uGoAEUmEqCZWyZGACeMEErBmCiB8SHarQQKptMhmKefJ8uitbu//B35DrX3oe
	ad0GLMYvdZEdCUVTSBAPtaVurk3JwwsrhScxs261jP63VHu4UhvTlZHqktwMM17lgUXGPcOO71tbH
	xKoHvvQVkEp0gb5ZXfDBjTZnmXnd/n66vP6VX2RoMrWAlgFf9Kppu0fJetqm1Mqbco5DoqAn5KLJs
	kE5mtkupWlLkR4YgYQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmqv3-00AhwX-1Q;
	Sun, 01 Oct 2023 07:31:13 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmqux-00Ahv2-1n
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Oct 2023 07:31:11 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qmquc-002Oe8-EW; Sun, 01 Oct 2023 15:30:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 01 Oct 2023 15:30:50 +0800
Date: Sun, 1 Oct 2023 15:30:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-snps-arc@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
Message-ID: <ZRkgKnpgW0tfZgTc@gondor.apana.org.au>
References: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
 <ZRbPBdu0ZJ86juff@hog>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRbPBdu0ZJ86juff@hog>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_003107_594406_3DFD8D5D 
X-CRM114-Status: UNSURE (   8.33  )
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

On Fri, Sep 29, 2023 at 03:20:05PM +0200, Sabrina Dubroca wrote:
>
> I guess the problem is that CONFIG_XFRM_ALGO doesn't select
> CONFIG_CRYPTO_AEAD (or _AEAD2?), just CRYPTO_HASH and CRYPTO_SKCIPHER.
> 
> Herbert, does that seem reasonable?

Sorry Sabrina, this patch is already in my queue but I forgot to
push it out.  I'll get onto it now.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
