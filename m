Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C440C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 20:46:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F5420878
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 20:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OEl/hNsz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Pge7Xeim"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F5420878
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hl1qtfL6cQ5gAGYJcuUXVCqeYQCeZZigkRuNPITqXr4=; b=OEl/hNszyNj3pRD1RjyI5ttx3
	vhlgwJIeyS6laRmUZsDsbN5n0C02lT/JDuJOOonfOwKrb0eNpd36SudI13F9xQ2K/PWKXatCXwW+g
	eAoO3TVtyEETl0VXi/QmPv3fF0XrK64hS24aeStEa6IV80SzGOLBkhXmt2ZkSX3Asaktxn84uUquh
	c4pdspTDVK1JExHabefbwFndoLPHX8nRRR2EBzIhKUA1gTxLUZ7E8+lXHpPfbOYl8IBL/1WRvcVk1
	F5nZaMHuOp288674cu2BCl9H9WJvYWmXguzsx9L1zkYPqaQUZ43h1o626g/ea3a/0huCMc0Ckif4o
	TLl+J6pdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWcd-0003oy-Tg; Fri, 16 Oct 2020 20:46:43 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWcY-0003nA-IY; Fri, 16 Oct 2020 20:46:39 +0000
Received: by mail-ej1-x642.google.com with SMTP id ce10so5089411ejc.5;
 Fri, 16 Oct 2020 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mAY0QDFqvIDjx5HUOQ+MdvNYA3kylWMqxJWjR23AFzk=;
 b=Pge7XeimtOGQPWwobIeFhAVFY6hovQZpX0ZLcKzZ8AVgQQQ672h2NV6G4tVk7cpmI+
 1+gpE/GaiJ6rOXia2sUQl2tkgPYRwpujI/1jI9yUuZbMHNhhdIPSSFFZisDCvdGyMNCm
 Bv7XKMjurquBEjLiG0g7MIjYLAxlPxapoizFVEWiVkAHI83UW9jV/Zr0Oj+Y0jv0AGkL
 cttkNhvMmB1Ql9iOu8/GJqu+JOcP+inoZKVjC8g7gRUssTThoHFHguWhzOQMKNXZP0Bi
 /t44sdZ14d2mGGgRgIH93pq2zHZDD0h2Gi9RGZg69aSc7fX52eFBBVlYAcrwgabfDNox
 6p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mAY0QDFqvIDjx5HUOQ+MdvNYA3kylWMqxJWjR23AFzk=;
 b=rca4+WkQA2OJW8iht3rzClODAgHX/7Q9vsaMGdZczRG4nXnt+PEWKpBIFEuqBde/lY
 qvYonVmgbB1zsjQh1/+uIzTeCK8zbGYt8StTjqecGsgAD9CP+bmbvnCT7vdhSSemj7Dx
 AH1sdDLVHoFYcvnm3c3fca3aK4V6ufCOIo45h33th4wVR1HEmD9l59HTZS+FLwGGM3xn
 Yt9vYpDcMbyFHae2b2D3DhUARN12/1U+BVW6pAv+oBEGuCmSESVN6X8GByCyfszsUxjK
 SX7Wswue1RcQ82OySCaTwGf66vTTMrtoht9X/TDwOsaQ+y4QQ5CvcXUFxcRHKlJeahGS
 uY2A==
X-Gm-Message-State: AOAM5322jMjUNkYDypYH6xMp7kosSoxjx2mmHHTd00vOauvB/+qK1+8z
 WUkVKPfMuHxdsy4+YEtSGFGCljYLyy2aBuyXHPU=
X-Google-Smtp-Source: ABdhPJzZH9WV53owno/ZkjiRehR4EVV/83Ve6RR9ZDeTZs5Z1Fi5I5Jf9JSdZ0IMRjggvROTLl8Mkpi59PwKfkncEXs=
X-Received: by 2002:a17:906:cc0d:: with SMTP id
 ml13mr5630435ejb.2.1602881195652; 
 Fri, 16 Oct 2020 13:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 16 Oct 2020 22:46:24 +0200
Message-ID: <CAFBinCDYu+C62P37QjY75xG8iXa+MwZEL-agNhoOsaXQ0OQpgQ@mail.gmail.com>
Subject: Re: [PATCH 14/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj
 property value
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164638_636456_852537B6 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 12:14 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> An empty snps,quirk-frame-length-adjustment won't cause any change
> performed by the driver. Moreover the DT schema validation will fail,
> since it expects the property being assigned with some value. So set
> fix the example by setting a valid FL-adj value in accordance with
> Neil Armstrong comment.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
