Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96EBC76196
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrztixDSqC2KCfQv63lAzoLXEFUAZZoHmtVOPncoczw=; b=Db8OjqQ60vnPQRTVEZz8l87x8/
	EcGWBrXMmc+d6wVO3CFBAu0j7VS0kFmlxM6soCqqzPKKZ2Liiz1zaKViiJLql8VKxxgXwHa2cT+i3
	oQaHKI7rzaqTBy9XrYJZsy4q8ho21Rls/ts03oEIJqMY9wfT/YgLuFjS+4KexQWeB2k2lh5Ozkj56
	A7vvlzhqQbm2NOG9npkXnpJZrBjhuuyV48Nqv4kdMju+29MZTl0GgFM3ptQu0vUtWBRB20N9xy06j
	GtqxhoOdjybIwqbCjQdTC8Ma6ohpa50PoAqLE4nyUc319RRcZdwkD6gmC2Ykn+0w2+WnCi1Xjd01w
	LU69bMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUyM-008MCi-2V;
	Thu, 06 Apr 2023 19:08:38 +0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUyJ-008MBI-2y
	for linux-snps-arc@lists.infradead.org;
	Thu, 06 Apr 2023 19:08:37 +0000
Received: (qmail 22331 invoked from network); 6 Apr 2023 19:08:40 -0000
Received: from unknown ([2001:9e8:6dc6:3c00:76d4:35ff:feb7:be92]:48442 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
	for <arnd@arndb.de>; Thu, 06 Apr 2023 21:08:40 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH 12/18] arch/parisc: Implement fb_is_primary_device() under arch/parisc
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de> <20230405150554.30540-13-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120836_265936_5AE4264D 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============3240121164203360646=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3240121164203360646==
Content-Type: multipart/signed; boundary="nextPart4819412.31r3eYUQgx"; micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart4819412.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>

Am Mittwoch, 5. April 2023, 17:05:48 CEST schrieb Thomas Zimmermann:
> Move PARISC's implementation of fb_is_primary_device() into the
> architecture directory. This the place of the declaration and
> where other architectures implement this function. No functional
> changes.

> diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
> new file mode 100644
> index 000000000000..4a0ae08fc75b
> --- /dev/null
> +++ b/arch/parisc/video/fbdev.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
> + * Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
> + * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> + */
> +
> +#include <linux/module.h>
> +
> +#include <asm/fb.h>
> +
> +#include <video/sticore.h>
> +
> +int fb_is_primary_device(struct fb_info *info)
> +{

Looking at this makes me wonder why the argument to all of these functions 
isn't const? Not your fault, but could be a candidate for patch #19?

Eike
--nextPart4819412.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZC8YsQAKCRBcpIk+abn8
TroxAKCInC1+nDFT2zUZ2BABKO6rWJJXygCfXz1dtt8vvCEpTBZxHF+hSbDdIVk=
=5z1v
-----END PGP SIGNATURE-----

--nextPart4819412.31r3eYUQgx--





--===============3240121164203360646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3240121164203360646==--




