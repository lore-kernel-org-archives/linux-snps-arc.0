Return-Path: <SRS0=82UL=6M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF99C83000
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Apr 2020 13:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D99120656
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Apr 2020 13:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZvVjEunw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="qr8YAaat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D99120656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s+mMx1zI/LWT5gt/I9kZS7bA89ujonyAwMFWMnyk4Zk=; b=ZvVjEunwhFcIABlMBGa76DYZU
	xWF6TA5L4STRlOY2as/DSMbqZW4snl8riulWlceiy5hzMpmOgljpQOjWYlqqEkBPkesZ5sgkWtwZ5
	6lHNhwfQH1UfoiJ7f4kpzWke6h34fYh/UJyzw3rl8WQM1EwMAvWRoGku0QOTFAJff7SEO/buylJGH
	LUa0PET4VU7NmvXs2zClhQhEBDp0DUq8hRtEnAcPwIomeEqLtINIwjVXUMslHqcQn8E9W6lqmI3A7
	LnKuW8DXtQfNyZMyX1WpWW5Hr1A35rjX56mQbnftdCFKfK7zlljnmNh3K/+JRyAfIFk8mO0nfr0WA
	kZSZX6ouw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTQfw-0007eB-Pz; Tue, 28 Apr 2020 13:53:28 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTQfv-0007db-3L
 for linux-snps-arc@lists.infradead.org; Tue, 28 Apr 2020 13:53:28 +0000
Received: by mail-qt1-x842.google.com with SMTP id e17so13861617qtp.7
 for <linux-snps-arc@lists.infradead.org>; Tue, 28 Apr 2020 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vS4iJIYQrd2PG3qpXR7gwQbBdxos3luPYGMuoEecIR4=;
 b=qr8YAaatEBk+zuLKVF5YjCDboTMB59924iv/8n025anxZ/qTouMaVjQ9cBaB6w1le2
 dgu2dDdHrQ32T/CPjZ+iID9ITPeQL9T3z6dYfR4U5C/T8NNn1D6DMar6XqukSa16fXdl
 lt4VoH4SEICLeDtB3y0G4nWQPnHasMFVjiayo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vS4iJIYQrd2PG3qpXR7gwQbBdxos3luPYGMuoEecIR4=;
 b=pHDnHTFYU+Nv0O5/M4g++E6bI8f3/AUsc6N6sYDdQ4hmIPFhj2fv/Gn5cA/7GJGwZJ
 UvBa5u73VXsmOunbh+JqXcPMH0ZrPBmOdphSolklUqmF8qpRaArHPIkdGxNmiOivAJgm
 AZbosXXCl9FH1hagKv9hk0n/y9OlWefwt34px7qc9VSU/hzPu6HKm9pJjkI9RojxYhd7
 jkT4K7svQbAIR+0fNq0/UZgB0THlg5xb5qRf/3T1+HszvUYU8voRvRzcWEsc1bHljyXh
 yZMmDMvG1dYSyO7X6OLN0iDWYqVMaAgQZFD+S3FxoH6x14SajAtkY5v7PCCOOauutL96
 dHoA==
X-Gm-Message-State: AGi0PuZ6QgykuY3cxOqX8TVsRoyTQxjy8WRM58EgZDWSa15f3hwZ/vmo
 7rMIjhP8CepnSn/YEa2E/+qMHg==
X-Google-Smtp-Source: APiQypKtAXbBeSKyofAn/TiYc6WfKFWjOfbf+uIWViaQ0RjmzULxzuBy2t3/rmQN2vhzeb+BC0k9bg==
X-Received: by 2002:ac8:7581:: with SMTP id s1mr28339805qtq.77.1588082005500; 
 Tue, 28 Apr 2020 06:53:25 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4e8-427e-eef8-640c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4e8:427e:eef8:640c])
 by smtp.gmail.com with ESMTPSA id x55sm13720118qtk.3.2020.04.28.06.53.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 06:53:24 -0700 (PDT)
Date: Tue, 28 Apr 2020 09:53:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] CMD: random: fix return code
Message-ID: <20200428135322.GF4468@bill-the-cat>
References: <20200320163817.8628-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <20200320163817.8628-1-Eugeniy.Paltsev@synopsys.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_065327_154968_AA5DE990 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, uboot-snps-arc@synopsys.com
Content-Type: multipart/mixed; boundary="===============5340217230449819914=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============5340217230449819914==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 07:38:17PM +0300, Eugeniy Paltsev wrote:

> As of today 'random' command return 1 (CMD_RET_FAILURE) in case
> of successful execution and 0 (CMD_RET_SUCCESS) in case of bad
> arguments. Fix that.
>=20
> NOTE: we remove printing usage information from command body
> so it won't print twice.
>=20
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6oNVIACgkQFHw5/5Y0
tywzsQv/VGpw3BVWdzDD/MLcPxyTi+L91KIjsrgIBKblKtKh0YTfDOcsb4AmaXgD
Vc4vk/g/MUPftkUxldSZ9s687QonT+4cdXYhdw+X117m6MsiU7gzlQYsxTfJDywE
UnoVOQ/OKu5L/uo4Y9FMgJYbKCJeclui81lLhJFZ8dsgGrHJl4Mn5414Ag8nidhU
lNNRrQbMQ18mNXMSs5/trfkrXlh3Y/yKkupcFEu3giEd68URwjsCssSU6+ej9Xe7
Pid9dJeznctcpev+pvj4LVRhqrVCP/qZQ9LT6MTNqhUDTH/iMEYF0ZMakjbB4H9F
n9bS70eul1uJ1V5D+Vh7hvtJSvEnkL+yHXMCFgTvrxLoEFrpHdW4uf15YE99k+As
Bny91ikcbz09YeHlsViheSMVHOUS3QBjeaVCxRfFnv6kjOvMyBKjyhIg8C86qg3+
JLFEktblQaM7vqyf11P586i0fhRnmFJMl1ThDvQFxGWpc0BAQqj9JTVC/ZpFooHQ
XLjNScnG
=Fuuu
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--


--===============5340217230449819914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5340217230449819914==--

