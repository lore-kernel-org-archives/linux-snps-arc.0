Return-Path: <SRS0=4Rev=35=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03D7C35250
	for <linux-snps-arc@archiver.kernel.org>; Sun,  9 Feb 2020 12:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E1A207FF
	for <linux-snps-arc@archiver.kernel.org>; Sun,  9 Feb 2020 12:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0/KDL/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E1A207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xR1qYGpvNhU3qAM7X+lfYYt1Ii0sc/NYFywysjYD6Cg=; b=U0/KDL/KD8Ym11VrAX7cS1N2t
	XkW4MVTtYZ+c/iGcGWxCcKPa5jOZljVChLS4PCkfAN2gZHnQ02EGRE0iixmxbAokQolHpWAGHIq20
	yebvJQTm8E2KvAfHhN4XkbBUCbrsPR8kFFMz3Vbqa30DaLU9lzu18HFyY0+FDf131kyo8gaNsS7kL
	RX7b3jsHCuxIkLhf2He9D0dRCE9bJDisoZyFJwWl5ff8uMz+QOV0OQA+2sjogyR00sJh9eq6Ym542
	7qHJYW5CHtY+49LFKGGOlyJqtMLtbu5NVq9NUBmQ9A1Z6h7KyUTQ6g2x4CuZbG65ikmPVmgx5b514
	5H0cT0Zdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0lh1-0005dx-4Z; Sun, 09 Feb 2020 12:28:07 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0lgx-0005dO-LE
 for linux-snps-arc@lists.infradead.org; Sun, 09 Feb 2020 12:28:05 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48FpGL1tNGz1rbLw;
 Sun,  9 Feb 2020 13:27:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48FpGK6xBhz1qrZY;
 Sun,  9 Feb 2020 13:27:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FVNc29bvmAzl; Sun,  9 Feb 2020 13:27:52 +0100 (CET)
X-Auth-Info: xsvgHKhXBqNMhSjxOkeNlE1zomakPW70YpwXp/XtTAU=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  9 Feb 2020 13:27:52 +0100 (CET)
Date: Sun, 9 Feb 2020 13:27:45 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
Message-ID: <20200209132745.6c8bcdd4@jawa>
In-Reply-To: <926fb7b3-4f7e-1c27-f800-c385a078e274@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
 <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
 <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
 <alpine.DEB.2.21.2002062149360.22384@digraph.polyomino.org.uk>
 <CAKmqyKODf8rBqhV708hzMMcdbEZEQrf1T2ABGi-3KLSwWozqNA@mail.gmail.com>
 <926fb7b3-4f7e-1c27-f800-c385a078e274@synopsys.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_042803_990180_53D3FF7F 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Alistair Francis <alistair23@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============4567362430373382221=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============4567362430373382221==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/NPXF1XeD+kwUQYD5.yJ+nIN"; protocol="application/pgp-signature"

--Sig_/NPXF1XeD+kwUQYD5.yJ+nIN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

> On 2/6/20 2:06 PM, Alistair Francis wrote:
> >>
> >> I'd suggest posting patches that are on top of the RV32 ones (maybe
> >> there's a git tree with RV32 changes to current glibc that could
> >> be used), and that only support Linux 5.1 and later (so you don't
> >> need anything much of the Y2038 support beyond what's in the RV32
> >> patches). =20
> >=20
> > Go for it!
> >=20
> > My working branch is here:
> > https://github.com/alistair23/glibc/tree/alistair/rv32.next
> >=20
> > My latest RFC branch is here:
> > https://github.com/alistair23/glibc/tree/alistair/rv32.rfc6 =20
>=20
> Thx a bunch Alistair. I'm rebasing my stuff on top of your next
> branch as it seems to have more time/y2038 code so will help shake it
> out as well.

If it may help a bit, please also review/check the current status of
Y2038 work.

Some Y2038 related work (mostly for ARM32) may be also helpful as well
(as some patches for RV32 also do the conversion for other
architectures).

https://github.com/lmajewski/y2038_glibc/commits/y2038_edge


Please also find the meta layer for testing Y2038 (with some basic test
suite) code on qemu-arm and Yocto/OE:
https://github.com/lmajewski/meta-y2038

(it shall also be easy to extend this meta layer to add support for ARC
as well).

>=20
> Thx,
> -Vineet


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/NPXF1XeD+kwUQYD5.yJ+nIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl4/+sEACgkQAR8vZIA0
zr3LCQgAs7L2YJV2FRM2x6OVddFlnuhuCsbzbrpbIdTYzCd7Bkivrq8GX5qUg93r
xA/53JrSxQlkHm8ZvwFCz9KBsu5Op2ZpWIdEgwm/qe05vxoz/hNzkpdO5+msrCxy
+Fo4Qgy3gmm9xrB2CFTMhvarQexWHYrD4qA2dVhx4bcXXMUTUA/1Tdr6447nuiwB
KbGthNNDUOQrq0MVsxgX6jIAIBWa8cy8J/DqJ3OQ3gEKFL1ZoKMie4f7Km3Crclz
jkpJ/ygeTxl9aECZWFALdFLeF2WAnERJfF8fSecHzfKHxBoF74PeETzIJUnbC6Me
YJH3wqY8IEQF2rmA5MVkhR3IR8NapA==
=VsxK
-----END PGP SIGNATURE-----

--Sig_/NPXF1XeD+kwUQYD5.yJ+nIN--


--===============4567362430373382221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============4567362430373382221==--

