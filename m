Return-Path: <SRS0=kBgi=IV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C25C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Mar 2021 10:09:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 689C7619B9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Mar 2021 10:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 689C7619B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cqYwFZkluqdBeeq6JFtm+9zzv9Xm94zYzud5L1eu6y0=; b=KWGXVDYNzYf4SeSiDc5IvCv3Y
	dBkVqzkD2f5GA4MsgqY5i5sWgEuCEeIwRvDtsYSn0SLG2ITjOHSPPNC0rSkWKapzsMk5ksPYxshwP
	Da9jnXMnBaHlJbZSxRwWzrysn7dH6N9rGyI1DDjdQ4vcE4EprPauiBl5Piv4Tk2eIQQ/fycUbM976
	zlE/iayfS/7WutFFN5YDnTh41JPxwg5EDaVWzMNi5+Nkmjc7imOsoARsDnXTDLrEwkW6L9DErkIOH
	z6X0DgJmqLSooSfYnVdoAmblGCtzPounHp0M25jZPf9GeX3LOCcc8Zw8keIvUbj5IfJ+IjbdFLXQK
	RRcsgm3PA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdyV-00EaDU-Ci; Tue, 23 Mar 2021 10:09:23 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdyR-00EaCm-JU
 for linux-snps-arc@lists.infradead.org; Tue, 23 Mar 2021 10:09:21 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 9B71F1C0B81; Tue, 23 Mar 2021 11:09:17 +0100 (CET)
Date: Tue, 23 Mar 2021 11:09:16 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 vgupta@synopsys.com, linux-snps-arc@lists.infradead.org,
 jiri@nvidia.com, idosch@nvidia.com, netdev@vger.kernel.org,
 Jason@zx2c4.com, mchehab@kernel.org
Subject: Re: [PATCH 10/11] pragma once: delete few backslashes
Message-ID: <20210323100916.GB20449@amd>
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
 <YDvNSg9OPv7JqfRS@localhost.localdomain>
 <91f4ba8b-38a0-dfcf-1fec-31410a802f5f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <91f4ba8b-38a0-dfcf-1fec-31410a802f5f@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_100919_791404_45148DC3 
X-CRM114-Status: GOOD (  12.26  )
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
Content-Type: multipart/mixed; boundary="===============2737959585416100950=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============2737959585416100950==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> > index e201b4b1655a..46704c341b17 100644
> > --- a/arch/arc/include/asm/cacheflush.h
> > +++ b/arch/arc/include/asm/cacheflush.h
> > @@ -112,6 +112,6 @@ do {									\
> >  } while (0)
> > =20
> >  #define copy_from_user_page(vma, page, vaddr, dst, src, len)		\
> > -	memcpy(dst, src, len);						\
> > +	memcpy(dst, src, len)
> >  This changebar also removes a semicolon.
> It looks plausibly correct, but the commit message ought to mention it.

Probably should use do{}while(0) trick.
										Pavel
--=20
http://www.livejournal.com/~pavelmachek

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBZvkwACgkQMOfwapXb+vKCmwCaA/Ehp1Zz5+JZhFGU3sdRDdhk
yAAAn3HojwFRiHt1hZmig8TuKvvY0/yo
=Tk2F
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--


--===============2737959585416100950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============2737959585416100950==--

