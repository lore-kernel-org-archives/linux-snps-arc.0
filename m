Return-Path: <SRS0=Y0WM=AO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3BDC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 05:23:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB148206BE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 05:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TAns0bo1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="flrnhIvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB148206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rempel-privat.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YQHFYoyxZlbSW6eBT97chgnxCryAlvMtSHrRDgVqdhg=; b=TAns0bo1qdAErUhS2DYGEmJzL
	vaSq38WTfrsCZwCsGezKPkQjap1gxKhjjWnwynZajgWDzkacJiaBCLH8z6HMWXuT90s9fjU6l/1P7
	qhHvXw0NHoJ3g83ThlFIg/EtMuic3irq/UFF+oPZEdkdEmtyPkwlwEu7yO+Fv1k+TPy+Ii9nXRSdo
	p0FvUngKQq8GKMYiRB+/ZcQ9ksmbPGnCLHoGgQ7fmrToVBEKo3RtorHqHAtXqKoXWp1rAFJBqjBt5
	HYUQVU41+lV8AfUBusp8Lk9/4ui9t0/yj5MziuDPUUOGafyRf6hsDH9g4a/2UqbIMbjoodE5NPw2v
	1PlKum6Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrEAj-0000sW-BE; Fri, 03 Jul 2020 05:23:37 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrEAg-0000rs-BW
 for linux-snps-arc@lists.infradead.org; Fri, 03 Jul 2020 05:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1593753810;
 bh=cGB1MJyHmTYktItGl7GH1r7GryQLs/lktb3odxxb/14=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=flrnhIvue/3yi/ZCnKBsOA13uVN0007Wcd6l7aD7DUscIpSCyn9UKB6zZK/WrWc08
 WZpMzdepoaUHZCoDp3+729lSL6Jgh7sWaTDZouMInKz3jPbVTNvHouBT1+CtGsuFeF
 f2PfUJ2j6582JSXYvSEqv8J2C6tbKUVIVOs9CL/M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.55] ([95.90.205.186]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1jEZsx3FE4-00cdlh; Fri, 03
 Jul 2020 07:18:15 +0200
Subject: Re: Linux kernel commit "add phy-mode support for the KSZ9031 PHY"
 broke ETH for Synopsys HSDK board.
To: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
References: <DM6PR12MB41060B53C1B81BD0A2D49ED0D96D0@DM6PR12MB4106.namprd12.prod.outlook.com>
From: Oleksij Rempel <linux@rempel-privat.de>
Autocrypt: addr=linux@rempel-privat.de; prefer-encrypt=mutual; keydata=
 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
 Rmpernzn0GXR0xYSTiUvuvpLsoo=
Message-ID: <1feb8e17-c92d-c7b4-dbe4-7ff0a23dface@rempel-privat.de>
Date: Fri, 3 Jul 2020 07:18:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB41060B53C1B81BD0A2D49ED0D96D0@DM6PR12MB4106.namprd12.prod.outlook.com>
X-Provags-ID: V03:K1:BoTifzBrf2i26C2GV1MGXOmHyB/Qs1qhxJY4u3QxYqnBdCKFMG9
 fTAlv7VlA+PevpjWQtnvH1odN7pwRC28JI7r0jTYHNIJOg5Ne0avGhNVmfP5uFSeJU4Ywqz
 SqXxLZrctWsXL4oJcFkz4LcWWFEo2jb8V5Xecq0geKlpiYrAkOXgkZ0ambLkY6POfrCPNeh
 Qt4G5OnVUGf00GrOKLb4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HYa1tD/vpgw=:w7sK0ki0accm9HW0XmfieT
 XS/SAJe7P87HvrG6wYwGmNAys4M7xwUCxY1ctIvhN937G4sgLr6BpsaBkrOzKRPsxWw6mMLmT
 Btk84qTmaudNgjG5PrwQnxAKNf/Ig1aKDkHR5le1r9GfTmFKRDoYr9eWVh2lHuu2hKVEdhCci
 8s2N5JhfB+qLrgAoplryrUlmAbSWh6lOwN8i7cGHuHaTT7QeHDzxf9g7ye7Of7ZoztjgiY4Jh
 qlPe8UayLV/PYvsodPisP9mvXp3UtWeo5r+tMfkWOXaxnfs6Hi7H5QiWjxfUqli0SazNUVNCy
 m8hUIjxJbUksM3f+4ARdS4ackSVgTXFpF2HPKuNBRmPoyXuTRf77gKOF86+minyJPVvHerofp
 BwavlVf40r8TOUIP381zAgXIRU6+ISE186Vz8xZz5ltbQ723cj6AtgdKkd67mT0aWgXYwUQqE
 wvusZ/vJBDvkSgBLS3f7r6LRiQTI+PLYIGBikoEk5d7fYu3wS+hHMTUOEENg/kP50YFpI1Nhs
 Tkigf/SH6XO3j0cs5WlXWispSjNqaI3dTn2hqCc/pk0oOWi/1Smvu53KO3RIWuSbvD0VZLZOL
 iHsSAgrl8VrUzwPD+QaQ/k5d7F1K50a0zscRD/zN0UJ7AkKB4AGg4l4Y3CvYtKvm6PHboCDCh
 ZjhEQ7upniDWBnBmpex4DYAzpaMEoI7MuDQtk1FcxGpE17yqvnhcA5q06Mn3ySLfBGK5pFFpE
 naj8xQQkq83l6x2/jkoKFg1fXbOKSK64LOyeq69u0k1mGq/q562sNP0fMcUYPfwVuFMMgKeLW
 tUdGKbQdDtJAsrl3A8jtc5HG/WWKUklui43zoHGh1mdoYFaINsDyV3vL/3qnD9lDprZJpsAYV
 IlqYq/F7YES+7i3GZa73j/RiTgejmCIHKzsKQag+vZwWdbqiOMNQXsOiE7XEv1ljGQdN5JX+q
 A9GDEc+azsGVxuzz5qNKx/mOzvp27EilLo5vA8Dw+1ndPpgJwsA7rx8XpnYfaTlkHowDsW212
 8oFxbUpI/ZebwMeSeoSFFsjY/F4JxpmDC975RGivhwvpYWHV67YQp1WVzwA0qhQl06WwtwmZj
 iXcflWYSoPF2nVLxGHsSbLHqpW3+0b8mgfJSe79JKzl20Mmxv7aepPnyDLVvP+7GGOMgNySxL
 +uOklrumUFu/6yoKDsApJH6I5IT4pIe4y11WtLAeIMq+MDVgXf/YVMfcS+VBfBaLlfeJhCVL4
 HhODGLbnMAHIrdowgq5hFqZHsYAxlBGnnUhy56A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_012334_609883_2314FA14 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: multipart/mixed; boundary="===============5496158743785237018=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5496158743785237018==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pv5oZcV2k10vaRndrSGjlrTk2QuX4oeW2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pv5oZcV2k10vaRndrSGjlrTk2QuX4oeW2
Content-Type: multipart/mixed; boundary="R0oX7L1YnwjhPs4lSgAmN0fqFOZtakb2C"

--R0oX7L1YnwjhPs4lSgAmN0fqFOZtakb2C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Evgeniy,

Am 03.07.20 um 01:28 schrieb Evgeniy Didin:
> Hi Oleksij,
>=20
> Synopsys ARC HSDK board has =E2=80=9CMicrel KSZ9031 Gigabit PHY=E2=80=9D=
 chip on it, boot log:
>> Starting network: stmmaceth f0008000.ethernet eth0: PHY [stmmac-0:00] =
driver [Micrel KSZ9031
> Gigabit PHY] (irq=3DPOLL)
> With recent commit bcf3440c6dd ("net: phy: micrel: add phy-mode support=
 for the KSZ9031 PHY")
> Ethernet stopped
>=20
> working on HSDK board.
>=20
>=20
> It seems that there is a lack of *phy* configuration in hsdk.dts file, =
see:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/a=
rch/arc/boot/dts/hsdk.dts#n229
>=20
> What fields do you think we should add to the *ethernet-phy@0* configur=
ation?
> Or maybe something else is causing the eth issue? Do you have any thoug=
hts on this?

Short answer:
mac: ethernet@8000 {
  ...
  phy-mode =3D "rgmii-id"; (or "rgmii-rxid")
  ...
}

Long answer:
According to the RGMII v1.2 specification: "PC board design will require =
clocks to be routed such
that an additional trace delay
of greater than 1.5ns and less than 2.0ns"

Usually, to get this kind of delay on the clock line, you should make the=
 clock line 10-15cm longer
then the data lines.

Since it is kind of complicated, to add this long traces to a tiny embedd=
ed board, was introduced
specification RGMII v2.0. It allows for MAC and/or PHY to have internal d=
elay. A device with
internal delay will be called "rgmii-id". In the kernel it is preffered t=
o add this delay by the
PHY, not MAC. Otherwise it will be a bug and should be fixed.

Since most of embedded boards do not have room for 15cm clock traces, the=
n in most cases 'phy-mode =3D
"rgmii"' is not correct. It will work as long as PHY driver will be fixed=
=2E Like in this case.

Per default KSZ9031 was configured as "rgmii-rxid":
- no delay on TX path (MAC to PHY)
- 1.2ns delay on RX path (PHY to MAC)

If it was working on your board in "rgmii-rxid" mode, then:
- the MAC added some delay. in this case, most probably it is a bug and s=
hould be fixed in the MAC
driver.
- there was no TX delay and the PHY was working by accident on the edge o=
f specification. Did you
had some kind of random packet drops?
- The clock line is actually 10-15cm longer then data lines.

Beside, phy0 on this board is bootstrapped to the address 0, which is bro=
adcast address on the MDIO
bus. Please don't use this address if possible. And, it is probably a goo=
d idea to add in the
comment the part name of the PHY. =D0=91ecause patching PHY drivers is us=
ually done like: "=D1=82=D1=83=D1=88=D0=B8 =D1=81=D0=B2=D0=B5=D1=82,
=D0=B1=D1=80=D0=BE=D1=81=D0=B0=D0=B9 =D0=B3=D1=80=D0=B0=D0=BD=D0=B0=D1=82=
=D1=83" ;)

--=20
Regards,
Oleksij


--R0oX7L1YnwjhPs4lSgAmN0fqFOZtakb2C--

--pv5oZcV2k10vaRndrSGjlrTk2QuX4oeW2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAl7+v5UACgkQdQOiSHVI
77Ql5AgAoXfp/nZW15k5TPp4MffNsUc3Jo0gx4ToxGlLHGI0ba2k9Yern6XwyNLa
9S4Kp95rA3FzLr5h5CeHgGBrWK1fsbLxgvjJ65oy1t46bC0YdK0DXmX1g4knU3pJ
5Qph4QP35OfuacwtujutP9y84jg5fPmvk8Vg1Kx9cRl1eKNcqn3j1RfKbezOD02j
aO85UmYAxkuUlm3lWm3zyvqXVLl7McZJ9HnfycHqo6oF/z8EOVejh7GFRBvxyjey
2b+K0EWvXinijELA7BMoNstrlPYsRAbHW+aWoqdK+Xbi6a7uMmTMxLo/qzClrwrd
X/RWhf1FapyhSy18qwV6ChSe4I0kWw==
=KiMw
-----END PGP SIGNATURE-----

--pv5oZcV2k10vaRndrSGjlrTk2QuX4oeW2--


--===============5496158743785237018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5496158743785237018==--

