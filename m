Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9962E71D2D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 Sep 2023 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5mo906S/+7nN69/c2LG4vkwZFt9uf2aHvpg4H/f6GM=; b=gM5haoqKVrT05R
	mExPcJrqhbid0fnkAW7Ffw6nt2/vHzbeg5wmz23b4taHUfuTwnaRPDuGKMzQ38Jn69NRPaS6tjoJy
	Dxxujf1zYcIaWSM3z53CmXs3XSixPX+5X6Gvp5dycAnw+GRbxH+afJMBGUd4Thx2nLqxmMHKMauDx
	i74E0UfxUEPhNyyPAmhOhceaF4bAbq6BCzDTc0kJwhVH9U8Nq7UXapfJCw2lty/67eYVrO9obYE32
	BIxWmH8k6mVj0HBPM/rBnIZN/rLeqqBTZeCmj6Ow0KmpZ5vqu97Rk63l1MUj+bunwJUYyg9U+SPr3
	xZ61/+FnKxW7JW9cnPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDPq-007xJp-2l;
	Fri, 29 Sep 2023 13:20:22 +0000
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDPn-007xI1-39
	for linux-snps-arc@lists.infradead.org;
	Fri, 29 Sep 2023 13:20:21 +0000
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-iSaAYYJJO06RazDCH-kyKA-1; Fri, 29 Sep 2023 09:20:10 -0400
X-MC-Unique: iSaAYYJJO06RazDCH-kyKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45C78002B2;
	Fri, 29 Sep 2023 13:20:09 +0000 (UTC)
Received: from hog (unknown [10.45.225.122])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D4AB1005E29;
	Fri, 29 Sep 2023 13:20:07 +0000 (UTC)
Date: Fri, 29 Sep 2023 15:20:05 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-snps-arc@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
Message-ID: <ZRbPBdu0ZJ86juff@hog>
References: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: queasysnail.net
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_062020_178901_07BDC864 
X-CRM114-Status: UNSURE (   9.82  )
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

2023-09-29, 12:41:51 +0530, Naresh Kamboju wrote:
> The arc defconfig builds failed on Linux next from Sept 22.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> -----------
> arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
> to `crypto_has_aead'
> arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
> to `crypto_has_aead'
> make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:36: vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.

Use of crypto_has_aead was added to net/xfrm/xfrm_algo.c in commit
a1383e2ab102 ("ipsec: Stop using crypto_has_alg").

I guess the problem is that CONFIG_XFRM_ALGO doesn't select
CONFIG_CRYPTO_AEAD (or _AEAD2?), just CRYPTO_HASH and CRYPTO_SKCIPHER.

Herbert, does that seem reasonable?

-------- 8< --------
diff --git a/net/xfrm/Kconfig b/net/xfrm/Kconfig
index 3adf31a83a79..d7b16f2c23e9 100644
--- a/net/xfrm/Kconfig
+++ b/net/xfrm/Kconfig
@@ -15,6 +15,7 @@ config XFRM_ALGO
 	tristate
 	select XFRM
 	select CRYPTO
+	select CRYPTO_AEAD
 	select CRYPTO_HASH
 	select CRYPTO_SKCIPHER
 

-- 
Sabrina


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
