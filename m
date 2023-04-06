Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C684BC76196
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukLbhDJ1kPrJiqZ9RpPn2pJ513bx3z7zKrCjMEhrf5Q=; b=pCMywof0cv/1jP9vH/E3h6oKzb
	ax7GmZXPuhJOuHMRZrbCwSgQCjVA4fGuLNmWjg86BIgQaELMtvSzxzAaegnzpHbvIl944ysdOYJk7
	SQNlxSGsYLeyH1mjuBBd+18hhp2gSjHuBwvMOtNEI+PxBEIhLsPBe52aSVTtmocUydk0pmWe1fjKn
	APx/9VLS/yiZIuqXwUqCJsNUnyqgcpv35VwQ979qVyxkboPu63V4CUqn61mQcBf0j1arVEpk9gMP4
	0MDcaHElDvz/3D7fI92Q0Yof6dFN4l9QHAXKvFH4nqFVyObsHzxgt+emuQYOlWjnKMfVFJM6Q8PZ0
	lJ3OieKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUxD-008Lyn-12;
	Thu, 06 Apr 2023 19:07:27 +0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUx8-008Lww-1U
	for linux-snps-arc@lists.infradead.org;
	Thu, 06 Apr 2023 19:07:24 +0000
Received: (qmail 22137 invoked from network); 6 Apr 2023 19:07:16 -0000
Received: from unknown ([2001:9e8:6dc6:3c00:76d4:35ff:feb7:be92]:59950 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
	for <arnd@arndb.de>; Thu, 06 Apr 2023 21:07:16 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/18] arch: Consolidate <asm/fb.h>
Date: Thu, 06 Apr 2023 21:06:57 +0200
Message-ID: <2675533.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120722_840852_09FA7CB0 
X-CRM114-Status: UNSURE (   4.48  )
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
Content-Type: multipart/mixed; boundary="===============6146605892802725690=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============6146605892802725690==
Content-Type: multipart/signed; boundary="nextPart12183111.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart12183111.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH 00/18] arch: Consolidate <asm/fb.h>
Date: Thu, 06 Apr 2023 21:06:57 +0200
Message-ID: <2675533.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>

Am Mittwoch, 5. April 2023, 17:05:36 CEST schrieb Thomas Zimmermann:
> Various architectures provide <arm/fb.h> with helpers for fbdev
                                  ^ *lol*

Eike
--nextPart12183111.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZC8YUQAKCRBcpIk+abn8
Tg14AJ9zd7fmAHjabsNv4XQ0wrtRdP3wSACcCiALyhR78u5AwNndFsBEhTvFQg8=
=2czj
-----END PGP SIGNATURE-----

--nextPart12183111.O9o76ZdvQC--





--===============6146605892802725690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============6146605892802725690==--




