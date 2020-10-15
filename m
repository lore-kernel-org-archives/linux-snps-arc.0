Return-Path: <SRS0=cQSw=DW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5639C433E7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Oct 2020 10:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1AB22249
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Oct 2020 10:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOA0/twL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCURctuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1AB22249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YIo+YrLalcfkQrbv14tc0xOvQNEgmwFh2hhE+ifS83E=; b=tOA0/twLBN1EnwuuQ5LL7e3bg
	pS+31A2WF7krEiAGTHCCnkzWeHkoLeyTw3kMhiJiDteZPTwLZth/+950UWkKrtVJ3zFyf7O7DSLmz
	2kP9HeWFp8R5REEyUyfOy1++o/jEAGFzjQGggwnahzJnYJnZO/qikcKw0hwGBTqUnoq4LDIBVCAOj
	nu959XY8lvEayE/1B0rLml7PIw9BRnrDsTq5C6AztMX2/hfXsgHKSzQH/3B5t3hq1J/MTDnoMNVXF
	lzxneumPJGxY2vcFyJaVqKiJkFJC2+s81vXPGHyA9icBJfwYpjVsMVUQ3LMjPuOQ3F6JSVnNutdPG
	dAnJvVUFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT0Ig-0005uJ-81; Thu, 15 Oct 2020 10:15:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT0Ib-0005tN-JH; Thu, 15 Oct 2020 10:15:54 +0000
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2533920BED;
 Thu, 15 Oct 2020 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602756952;
 bh=Z6L85tl0hUzxc/Wf2yAWwRbRBy0g42YVSMNsAOso/ic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WCURctuRAO7apKBpnigKSW4w0RrSEIpplBnDIjs+ve/o+8+46MlY5TmxYzakNSnGt
 wshd18tKRcbQS+ist8JlaxoOpSixojILJcBphDceJNvzEVJ7nc77SPULh7DZu7zIN5
 MdYW0FZqoioit4bvm377ZfhSD1iKvlH90Ra8372k=
From: Felipe Balbi <balbi@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
Date: Thu, 15 Oct 2020 13:15:37 +0300
Message-ID: <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_061553_788184_9EACC3E7 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: multipart/mixed; boundary="===============1425927366865842071=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============1425927366865842071==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:

> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
>>=20
>> Hi Serge,
>>=20
>> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
>> > In accordance with the DWC USB3 bindings the corresponding node name is
>> > suppose to comply with Generic USB HCD DT schema, which requires the U=
SB
>>=20
>
>> DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuf=
f,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI =
driver,

in Dual-role or host-only builds, that's correct. We can also have
peripheral-only builds (both SW or HW versions) which means xhci isn't
even in the picture.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+IIUoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZO3Q//SiuQrPc8kbjk55HntU2Nq2ql7KHubHOj
ZhrcegAbPbzA0vqIIasxjkXAC8Abbz3Bn59kDuu0ohRtTG1sKXMrN1aqkIo1tTh+
zkF7t+k5cdunzJ19jb0lohFu/eDK0JPuXRoByJfUhbxIZfWbacO7bG8TkClU7zhL
denO6pfQG1nOetdAaHZV9imMuTKJOrnl+bcHx5tNcV9sH02sC6OVXBn4dN5ZnABf
/FdDd671tZMcz43t7jm1vNk7yxgZPSqQ6myBeXQ45ZL2mn9i0gyi4eEWy29vLwu9
kVUhb9nrliaBsf/X/+oh05qRACLg/noIcuSpXMtu8tmR2DIcwDijYG8XOsBaDLEj
ZYSJju7/JQ2XUmrS2s/xWtjcqQN0ZxVsJx0Vy4JZNRQ404qs2cqjDeUFdclP+fdJ
90W74TKzXS1/t52pQyG84LSM648I/7PhUWara2RV9jds7XPgFuFCwWTxEKkyQCSW
ayPWVASHrKX0Kzp77GW2UUILCIo+luyMMd7V/BraTI6L+PMBL6+etB/O72UUXdb9
E2hQyJojMpg7BZ6dnpLcvbtHetLtW1hLisTOfD3NbPUyJzPJAgLt8D77SN5ncTUy
nC8/57GA0Bs2uzYEB6TlPV4i7c9tLT3MJrlVE/p4uziQ7R/b34xbHDX3xNcspk9Q
vO7uMM8lF9I=
=XrV0
-----END PGP SIGNATURE-----
--=-=-=--


--===============1425927366865842071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============1425927366865842071==--

