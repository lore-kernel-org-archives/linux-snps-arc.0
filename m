Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417C7C32771
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 20:38:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E2C22525
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 20:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huY2S3k/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="AHtJrFMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01E2C22525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VQ7YEulk7KzmF0mjrkH8RVL7yHqVdk1M2JMQYoapxcM=; b=huY2S3k/xz8xYEdeXLyTsE03u
	T+2QqGYMsnZ05FYqVRRxCZzwmlQl3CYUFbp8jz0xcJiH1Ccl3h37X29QfRQtRVOqG0b+hX20awaWT
	nISrd6qg5b7SuILMhU2JtGnPGodPAHQzMSLpN82xikgETBwLNmCTdvmAOfifeqAqM7n+6z/tVQqd3
	7kQeWHffDZseK5jeCepVbYnN6Sy5ap6RA3IBL6W3KsCL3qusxubr9KVU11B5nxE9dF6b2F+ZpbB9H
	3R1O3hWoiv8e55eMY0G3Q0xJZfYPel4eByUU+UP3LbBRO4FIVuowAnvol9yyA5wklAwG6tl3P2eit
	pyg5RnlGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itdot-0002eN-7c; Mon, 20 Jan 2020 20:38:47 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itdoq-0002Zr-0W
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 20:38:45 +0000
Received: by mail-yw1-xc43.google.com with SMTP id h126so419755ywc.6
 for <linux-snps-arc@lists.infradead.org>; Mon, 20 Jan 2020 12:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9czIjGd+8YJx2RnUN7fQBPwwWUMZzJFiiCWsrX/CV6k=;
 b=AHtJrFMwUsOCK67JyVNJYwUGlwen9ymy5GfRMT5nscMH9uMNDuDSW0ynaUfCIAsBLr
 s3jKxoLeutdBqHee7nJK/ef0nrUPZZFJX3KXoXqMdpvCd0wzbXmkY6tmKZk327koNTIV
 JenV1QwJVGiNuiN8hP8eS8Q9q0W8S5JMaZFXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9czIjGd+8YJx2RnUN7fQBPwwWUMZzJFiiCWsrX/CV6k=;
 b=AfoWKk5Sk46/r/K0ChNHrtDHoiCMBSZipjyrx8UYO+NwIYAkReYI7pnHIzh9EBNEym
 0ZHnWW2yH/ph7zAokOA53eC7s6IgX0RopPNYvNkvVGlf0ONuT6ZDvnXOUzaHAnSff1ox
 ekeLTUwUf39aVs3Y8w/tVgYBHfTkVl3Pjkv6AS/bDjcXQBUrpDkZTDXe3E9wCvIg0ehH
 YyAUSoMDX8hlrPOqXbRmrPiyDcOSAW3G0YVv9Vuyjjv8OZp3Er+eicVw0rWieCyDGMHW
 okTgBCpFV+5Z9aje/kl+bHQhHckhGK91Dx2nAyrhqjBfSNkekYpI/4k1QXRxBIXaU67b
 PDug==
X-Gm-Message-State: APjAAAVgqpY2v0wP2xV+AvHpJnJjgFbS9Iu8hIcR+NZGcNXcL6VLL76i
 x+Idkd6xzYT12Pr6QqDIwChVCA==
X-Google-Smtp-Source: APXvYqzfgcDwNw46JwUAinB38asHvxLt9qVnZZHzkqwEnUtpYGYUrZA7Kd+XoeW1o5zNmz0D6i+ZtA==
X-Received: by 2002:a81:6344:: with SMTP id x65mr651794ywb.271.1579552722582; 
 Mon, 20 Jan 2020 12:38:42 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-b96e-413f-6954-8a35.inf6.spectrum.com.
 [2606:a000:1401:86dd:b96e:413f:6954:8a35])
 by smtp.gmail.com with ESMTPSA id q124sm16572884ywb.93.2020.01.20.12.38.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jan 2020 12:38:41 -0800 (PST)
Date: Mon, 20 Jan 2020 15:38:39 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [RFC 0/2] Import and use non-atomic bit-ops
Message-ID: <20200120203839.GL8732@bill-the-cat>
References: <20200120124329.3001-1-abrodkin@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <20200120124329.3001-1-abrodkin@synopsys.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_123844_077054_DC15609A 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Rick Chen <rick@andestech.com>, uboot-snps-arc@synopsys.com
Content-Type: multipart/mixed; boundary="===============3336661786492938222=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============3336661786492938222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ZF6ft5jA1BB8Hg/"
Content-Disposition: inline


--5ZF6ft5jA1BB8Hg/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 03:43:27PM +0300, Alexey Brodkin wrote:

> The following bitops are implemented pretty similarly for many
> arches and now when we faced a need in them on ARC I guess there's
> no point in copy-pasting them yet another time but instead it might
> be better re-use generic version from the Linux kernel.
>=20
> Since we had non of those bitops for ARC inclusion of imported header
> works perfectly fine. As for other arches I do see they use a bit differe=
nt
> implementation but those might be just older versions etc.
>=20
> Sobefore breaking stuff for other arches I'd like to get some feedback
> from maintainers. Or we may just import proposed header and switch to
> its usage arch-by-arch whenever people feel kile cleaning-up their bitops.
>=20
> Alexey Brodkin (2):
>   include: Import non-atomic.h from Linux
>   ARC: Add support of bitops via generic implementation
>=20
>  arch/arc/include/asm/bitops.h           |   1 +
>  include/asm-generic/bitops/non-atomic.h | 109 ++++++++++++++++++++++++++=
++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 include/asm-generic/bitops/non-atomic.h

I would like to see this as a series to re-sync
include/asm-generic/bitops/ with a more recent Linux Kernel release
(it's from v4.2.3 per git log) and then add non-atomic.h and update
nios2 to use it instead of its own copy.  Thanks!

--=20
Tom

--5ZF6ft5jA1BB8Hg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4mD8wACgkQh/n2NdMd
dlIukw//S1aj81J63Zz6VEzPyPinjLvOVi27mH4GvsR/QYZJI2DQi19JkAbf4ySZ
cOEP9vtjWSytP+F3+By2TZf7eNlnX5E/QSR2LeuNO05fa3qWHTP4piPaIK2TIipt
FmE3r9VI6EPMoG3dnzfWqnS5NQUPymgROqT0DLeSbVv0KQwhh4XLnl2H7FEiFDBQ
3VMewjmLlgnzliOzmTvBXmAuppyhnD2wJ4eS/leKTyBp4rEnM6v5GF9HmcirxKIy
EXatRcq/Ejx6R0iMwvTE/nuxbO7o3hvOF2u5wzdrtLpVsIpRcU2E+G2GSrEfgtEv
esppF3j3GjsrPWpgle5OTRjyzVQ7Nz8EV9AP6doSB2zP4ENXm5Ihwxo1nyd64s2F
VuGH8rrlGjVC2LEPeuf9uSWpDZm2gN9MwOa1yRL/MKISj4WCRToEcQb2io4tVlTg
CfjhqlHMPkPob4ZmxdSw3+uiyo4PHwANI7jGP0JQiWpW3ED7HBS+hF1+JYO1iOY4
Ig6QmGbtw+UQI0QjQi9O5J/UiPLY0ugdVf5cgOqoLAEk/3FMbPH6P3IiRxmZpaRV
F+jL0ywdqMHo+q/FWWyuQ8Qv05Ne0Le0Q/KJ9ETumWRbvqM8/1OR59KIhyBYKFjA
VuhfLZkSmHdq3/jkJKoGwLwWuL/WF5sPVJltv5iVWejTH7GWvo8=
=PlTU
-----END PGP SIGNATURE-----

--5ZF6ft5jA1BB8Hg/--


--===============3336661786492938222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3336661786492938222==--

