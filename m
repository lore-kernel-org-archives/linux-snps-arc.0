Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D3FC0015E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Jun 2023 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yso9dG7fQcVKQfa1xevUfMVi+AVLYkHrFqyYoGw04k=; b=S/nZChbszbbcM9VqQHmYw3rslK
	H5gAlMVlnr3JtVPUXrBingmbjo8XaaIkXQV2ePQa3D2M22e8C/mqq4XF8QtA4cadL/YVAZdBm+0OM
	rqCX5wOa4vBD/Wv/plEjuow/uOgYR4WaNAJWqq8yNMisBcz+6IPFvzcF4cSD+DK9oMTHkZR6OJ0zs
	C0p/aL8UnM0OdEcNKJH5ZfkneBapZIsNNhAKXlEtNoXZEj/8oR+8H79zUPOv0LhpJvoNljn8koLOC
	E/esQi8cq7S1ogeeSQOuwj0o1g9Q+BkOof9H69nlzJDnVsYG7CMxoHKn1k+2jJJFbDrf0kxKRJeHF
	CJwu9apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnom-004ajx-0V;
	Fri, 23 Jun 2023 20:55:44 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnoc-004aeB-0J
	for linux-snps-arc@lists.infradead.org;
	Fri, 23 Jun 2023 20:55:42 +0000
Received: from leknes.fjasle.eu ([46.142.49.205]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MNbtF-1qS1JM46Dz-00P4i8; Fri, 23 Jun 2023 22:55:12 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id F006F3EA3D; Fri, 23 Jun 2023 22:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1687553709; bh=/zs8pKuVXLztJtcOtsm1AgBqJ6bbce3gdJiuX7Qc3AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opQXZo2ktEW/Lu2ISSW6iZtO1fBrMM06STnPzvVkUVmLL06YnLwkiSymhlyL1jWG2
	 EC8rc3i6WOtIUw6pmlt3BkNTR6soVW0FJEeD/5yKIDdlFGxdS3IWQetFxL5hycxVjz
	 5WR5mrZ6KbfucrnGZ8VzKltEzmh1iEEOvsV8H+4k=
Date: Fri, 23 Jun 2023 22:55:08 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: builddeb: always make modules_install, to
 install modules.builtin*
Message-ID: <ZJYGrC+3l50kcNkl@fjasle.eu>
References: <20230615111743.883891-1-masahiroy@kernel.org>
 <f7e9220aad3d98bd174f7dcbd68031e1e15ea968.1687461492.git.josh@joshtriplett.org>
MIME-Version: 1.0
In-Reply-To: <f7e9220aad3d98bd174f7dcbd68031e1e15ea968.1687461492.git.josh@joshtriplett.org>
X-Provags-ID: V03:K1:WrZ7MfH0d46/XjgZv+BwCHXBbU2AcHmiUYZs4bF6vyW19YODJEv
 OcnU/WZ5uUUWaWuylYMZZwAltu23VKq5SOKaI+10L09ys02CPeCIUVqqeJV+Fo1R6n7Fp0V
 x7IbQadZN3R4OrYYQ9Zzhhyoddc+4IkURg/F1vy4fzyWesEfNgvDMZzSeJizm0K1g72tNvw
 GP28NbRcj3gWqNj9S/BXg==
UI-OutboundReport: notjunk:1;M01:P0:Wo85uib8gV4=;bMFL52HzeQnR0BtrNo8OniHR1h5
 Xi/7hIGw8znmM1qv7FnUH4CauBtaohBXwcGX3mrY4xQoU+4zeYZAFMl2snrBv7sYqLmMwdIgn
 z659cZtIs6w6x0WlmNWf3B5OgFBh/wfeAm2Ld0jIW+e/twNtxv0yj7ldHrtDYRGZzM7JFVI+H
 tNMZPk8T/mtGVfy1a1K1Jaql1Hwd8jgG8twPuwZK1wgAp/3ZCPNJXcs2X6iaJwiYWBc+tcfFD
 J3BK4MzqXsMKnFUIkI/bIYVtKxsZyMXsDKFzk1xBmA+y6b/A4/UcCNBF8ImU3LtTX1BJQu1uy
 GtdHwStCTWSnFM1MCedt88BYMrQYeukg/hXsW48xK2/sZlJaOkBuu0uo8wcsGICYl0VxfUcFX
 yzlrfeGHBHDGK8mJ9ThA2DYkLwbLXXdHNMgroYYNs/WDdcXXcygUdkYXOWakFIRCfbIJvIDre
 7NpQhFTTx+2wbL0PZhfgxRToivjvs1L4Fyabe71MSGeukMpk92ywuoZsjpqm1hEPzv/kwUjCB
 /TqA8tYb1d71a2X4nu2HqfxXVO/GN6z0VWJNpA0CUew4hGHCZqi7Cj926IrTHtdzfHdu+dFk5
 yrs7A811f9cFMsgE2AhfgSZycIwm0apEr5PwaTUaQcwXfx3leos6bhqwsZ+EqZC9ZALRv9sYN
 vtvs+ZfXAId3rGYSqFjyVxqj9ctuIRmgHLKnOh2ROg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_135535_668653_9299CA99 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Type: multipart/mixed; boundary="===============5411896607161035574=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============5411896607161035574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eTEBsKav2BLy7Olg"
Content-Disposition: inline


--eTEBsKav2BLy7Olg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 12:19:53PM -0700 Josh Triplett wrote:
> Even for a non-modular kernel, the kernel builds modules.builtin and
> modules.builtin.modinfo, with information about the built-in modules.
> Tools such as initramfs-tools need these files to build a working
> initramfs on some systems, such as those requiring firmware.
>=20
> Now that `make modules_install` works even in non-modular kernels and
> installs these files, unconditionally invoke it when building a Debian
> package.
>=20
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>
> ---

thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


> This patch depends on
> https://lore.kernel.org/lkml/20230615111743.883891-1-masahiroy@kernel.org/
>=20
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 252faaa5561c..f500e3910158 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -62,8 +62,8 @@ install_linux_image () {
>  		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH=3D"${pdir}/usr/lib/li=
nux-image-${KERNELRELEASE}" dtbs_install
>  	fi
> =20
> +	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"${pdir}" modules_ins=
tall
>  	if is_enabled CONFIG_MODULES; then
> -		${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"${pdir}" modules_in=
stall
>  		rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
>  		rm -f "${pdir}/lib/modules/${KERNELRELEASE}/source"
>  		if [ "${SRCARCH}" =3D um ] ; then
> --=20
> 2.40.1

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--eTEBsKav2BLy7Olg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmSWBqwACgkQB1IKcBYm
EmnWfRAAtP85RutI/lZit0ETIZsCYS4olhIri+eUsdAAXiMeRmh4QcDhuyEWgppK
2J0oI1XOQY45GRmID28iGIPjhIG3/bd+TWnIC4tDc3/z+DWpmWIc8O3ICuqs5luJ
MiWgPH6QVvGSl3WE+i48X8kP8AxizXeBP+SSxQuQsEMqfi8fCPm/l2wMReOTaKJ6
3VMeDqvC8IPdTSOgyO4TrdShwsTRBsMUDzkZ8kYk9ElbgdO6DX8Pz4YENn473aaQ
JgYlqgHkXDmUAcud+CA49Lsp+GDIV+SQPmcZTCuSKEvWkPBjOMM1/YoErUKeaTht
DehzO3DqlWN+6yTzHUIE94DTQ/rBJ9qqir9psg/jE6Ud22QlOFc7Wp3FP47qNTkm
lohdvXWQfRvkOAn9zb0IehTwHtW2zJ3I4+B1gN0kFrUyWA8xqHpzBIC17iJhHyJe
XeTwnGAO51su8fqpESiISeGGt+3VTSpJJt39lGlAgsRFf8H1ETUF3vyTncM+vZos
8/mgs7mCgN6kaiJYiTaMNgEctFUG6gG9t0SFJP5spGrz3pvaJwBv2DofQzahFSLk
E5GAtaBuHf1pMVeR8BzwkCfFN7ajF/3xbm3fZbIbnLYFfJ5Sfw29VkUrPI8zyseg
ne8e7LwfsP369WZYp64JMtEFnZfxkwxSaJa6csH4EYHUl1sBtuY=
=xiGO
-----END PGP SIGNATURE-----

--eTEBsKav2BLy7Olg--


--===============5411896607161035574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5411896607161035574==--

