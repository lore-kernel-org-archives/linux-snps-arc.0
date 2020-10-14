Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44847C4363A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 14:10:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BD922202
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 14:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4ORMRZ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKV/QHc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2BD922202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1uCipFJ6MvDzZz2qrJNXTOPC/POIcUW076sA9vTI2Is=; b=X4ORMRZ+6JbQLoXVo84Ng6oeY
	zlVPrkzxgn7pYgB0ELfgXdkymlbEt8j7Z6Omrn9/HPiMhvBGwqaszq3G/PLwANgoWcojXdu/Z+80P
	gDAradpzD4ogzhK+zTJkQ5L3v1Zxoaav16jxGKf9oasi/EAoZ5Ld+qM0x92HrfZF8hYFVZFukX4Qn
	8KfcZ3TuKSwX6lp8QqxC+FGW+AHi32ZuynXUOiK+EpnX5V1g+cgz8noe+JGLF2Rb95EP3+QubPCyd
	UbmXBpKz6cRdPdmSQ4Hw8Zb99DozZIX2IV/d00z/sUXYI970oVy9Y4ZjEC7zMW6G5C7JGEs3FR8HZ
	THsr8+VGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kShTi-00022r-0x; Wed, 14 Oct 2020 14:10:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kShTc-00021A-5S; Wed, 14 Oct 2020 14:10:01 +0000
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B74722201;
 Wed, 14 Oct 2020 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602684598;
 bh=nXHNrmeiegcAFrQHpZXClaxYDTMwa1rlJ2izCsCrXN8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YKV/QHc62ApKcYfobKVgr7H4uuaIl0Ym5KPsO03PueFYTPIdAa9yS3LR0EwZ8HOwE
 TcL6jF+RwT4ABH1kDb5oHOxvnawJXJUclIoLNBHrYdepJyQT5rQ5R11/OPvOyIAMKq
 7ODxxrUbh0gZi9Rm21ebmCKNc4FTGHkE4lsI7GBs=
From: Felipe Balbi <balbi@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Jason
 Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Kukjin Kim
 <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson
 <bcousson@baylibre.com>, Tony
 Lindgren <tony@atomide.com>, Patrice Chotard <patrice.chotard@st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Wei Xu
 <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
In-Reply-To: <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
Date: Wed, 14 Oct 2020 17:09:37 +0300
Message-ID: <878sc8lx0e.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_101000_390370_FE19CF75 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mips@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, linux-omap@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: multipart/mixed; boundary="===============3026628559388831802=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3026628559388831802==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Serge,

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> In accordance with the DWC USB3 bindings the corresponding node name is
> suppose to comply with Generic USB HCD DT schema, which requires the USB

DWC3 is not a simple HDC, though.

> nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> the dtbs_check procedure failure. Let's fix the nodes naming to be
> compatible with the DWC USB3 DT schema to make dtbs_check happy.
>
> Note we don't change the DWC USB3-compatible nodes names of
> arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> in-source comment says that the nodes name need to be preserved as
> "^dwusb@.*" for some backward compatibility.

interesting, compatibility with what? Some debugfs files, perhaps? :-)

In any case, I don't have any problems with this, so I'll let other
folks comment.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+HBqERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZk7w//f7M1cvtdCrKz6Ex3lntgWpy1b1/3CtTd
mvDjI3ih9c0Lb8I32xXaiI6KCbZ4eNrTj44yQGYTqyCX3MTK3XhtDsifpFsScl3V
HNZ5Aeru3C07GbrJgOm7anOpkrtOe8D5prOys0uLczDpjlK2nhg58Sy41jGaoqjH
X4AW8yiKWmvPhuqqX/vzqhYettYoS2B6bNL21uXqyfcmXubL2+WOBKoXeYrZUfd+
1xuyAt/jucQh8nhY5050kmbWKt7l5R3eUxe8be064Vi3n6CgDELde8+i+t3ULBkn
GzjZjv9cTjZXcd3qpLXLamKnCGSmM5ckc5O5sRKQHaBmtHuCW7SbH4/6iTJBv+n/
0WlVCedKu6N5OM3Q/+kfu33BDFfG2Dl6uK6vrt97G3jbx/IeddwccIGU9DmFfI8J
5Yv7hMCi9vPLxVNPCi/26FxsL7PmziOjofwUfuvP5ot8EKs90frsJCsE//ADssca
n+st1b+uqmK8qEtUigv9cC6h0DlrpzGTMyOwx4QBo4BN6YEICxzXq9wI/UOoZopx
tOoqi5JpD/2MpJ2qQhNLlsJ6voBSI4pMSGAV18RpSchZ5WhvL+IvFUU1gFsq7fek
MtrO6wBURV7ypfo9V7dWpM2trYsJQIWZs7x5nR8vnejZ/YspsdOcipU3QlKW+Eez
Pu/hVbbAotY=
=wmBj
-----END PGP SIGNATURE-----
--=-=-=--


--===============3026628559388831802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3026628559388831802==--

