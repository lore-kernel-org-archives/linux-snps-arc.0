Return-Path: <SRS0=gW0p=5I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457CAC3F2CD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Mar 2020 15:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1935B20637
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Mar 2020 15:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O1Z7GiZX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nhETMBVe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1935B20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWyKH5eNHsOZAYasIOuR6jDEjQp34IA+Vfn3u1WVScE=; b=O1Z7GiZXEIN167
	HIUQRHj9U8blF2Viioda6BU8SqGgiAD86wYcL2dKmq+1x+6NykHBTzj9q/iiCHddwYNdsNyuxmqHt
	OGIilM1AbEgSeHvC8L+arpPcL6KBX7f1YbM/fEqQ0NnaYBUxzq5/5zAvTr7C6tG4zPVN8lqdQkCmf
	+F1MezWU3w3TWmWk8yUJY15nlbVVwAG5RpCIwJo6PFjJ/N6Ks1wz2knf2k/NFNcHiSvTk0gGcnVT1
	Y8JLIAfRCM/9xj6Q9SemIOy+4cXTRrLWZP13OYhBhNfHabtnPqyeE8A0j1XYJzE1X3BLc4Z81JpFx
	vKLuY4VShz+OrHLS9Lww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGP8k-0002c5-99; Mon, 23 Mar 2020 15:37:22 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGP8h-0002bj-24
 for linux-snps-arc@lists.infradead.org; Mon, 23 Mar 2020 15:37:20 +0000
Received: by mail-ot1-x343.google.com with SMTP id j16so13818619otl.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 23 Mar 2020 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mhUcYtbCv7FpbZdfIww/Zc20CpB3zlBgzfmaqV4oBY=;
 b=nhETMBVeAeO5KDyiE4+0bSTAmCk8NR6iR1zFGDeLdfrU3v2csO5ttp8a7qcqf+vtYv
 KQO6CRbfSYIgulGdXpv1eFfX3YhSJNhMiOBbOcfvYtobforQIbqvnb9SxF1ibsibbdUJ
 YejAv8Xg246cKIiyIrpLk9XrcOVXs/kUhm/e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mhUcYtbCv7FpbZdfIww/Zc20CpB3zlBgzfmaqV4oBY=;
 b=eLkZapDwGkkcXrgYorWMKLhvGM6mHam26PfTyoLFP5Z2JbI93tSJqAJNcWX5S2nJe4
 3OiWhQqlR9vUGOywTRcEDKRIpTasKKydJJ1goXJfR7l88WaDwYtQdAzfGV0t8XV0zBKZ
 ccxzRlgl5CrGhSzDYU+EK7zWoAPqxt9/UEJ9HhZKicDT9BGe5RUqR/akBzJMGlZCGxqE
 G1zs0J2MVHUlxpqv/lVjWntEBAGX9Ac5D6HByJd2eQLRcGfpHMxd2K4sh+D8RiccEJ9O
 znQkEoBwvcsTxNx7a0hu4AOqw898dFjW4fClI71e5PCiOGhK0EDsl1ykY+HqJZRYCaGV
 PmUw==
X-Gm-Message-State: ANhLgQ3gMRGIZXX8puxD3DOPWqN6QO4NSuBAG1gqGXmbx6Ckzjlj2EeZ
 guOKiavqGlHN2meZWoE4HFNIU1mkc2HrB/kyRV410A==
X-Google-Smtp-Source: ADFU+vu2owjYV36sd5JcPcdwtAiemHjW4G3SbckTaQ4xiDRiqRNmyTgrJuGh81EdNNegN7eOEFgte560Xz6BhSZ8Dm0=
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr19497068oth.48.1584977834913; 
 Mon, 23 Mar 2020 08:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200320163817.8628-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200320163817.8628-1-Eugeniy.Paltsev@synopsys.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 23 Mar 2020 09:37:03 -0600
Message-ID: <CAPnjgZ2nauDtf2Wa4WCSNaBp7wkmSH1NpNHmj5R7RX+RD4Wp6A@mail.gmail.com>
Subject: Re: [PATCH] CMD: random: fix return code
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_083719_126284_40465509 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: Tom Rini <trini@konsulko.com>, uboot-snps-arc@synopsys.com,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 20 Mar 2020 at 10:38, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> As of today 'random' command return 1 (CMD_RET_FAILURE) in case
> of successful execution and 0 (CMD_RET_SUCCESS) in case of bad
> arguments. Fix that.
>
> NOTE: we remove printing usage information from command body
> so it won't print twice.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  cmd/mem.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
