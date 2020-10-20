Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D1FC4363A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 19:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1143B22251
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 19:34:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMaixYsX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GX3Yqx/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1143B22251
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xFkUjLZPSXV/o09FzasY0KxLs74mKDOaR601bLdmcHE=; b=BMaixYsXOnOh5OJyoOd98SvOe
	XvjV59PHG4J0ueL2w1e0Pjia+QpuYrbQIOTWMPRb3IGywa8ClrpotKSmVij/2f9IaiXccnkuAfUqV
	nLqCqxRwC19mB0SXz66nSCh7Hk+rEYElMXHWbVrWBsTIYmnC0JtjwYeHleIMk+ahpN85N9ADOYJEl
	2fxlYehiA/Mqa1KVGOv83eNlt6OFxCCi+TZlzVkblY9fIiz7jnmj0xuLRtBPBnYPHEgZu3tHx7HBr
	GFKfPUEelwWG5KoHsGBAjuDHVzNh/Um+0rrZl98xON9ZwUapDKv/gMS/Hqy2vwrxcTTE/tuz7naPz
	ijDcykyWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxOt-0000Lx-VL; Tue, 20 Oct 2020 19:34:28 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxOp-0000Kz-Mr; Tue, 20 Oct 2020 19:34:24 +0000
Received: by mail-ed1-x541.google.com with SMTP id dn5so3056568edb.10;
 Tue, 20 Oct 2020 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
 b=GX3Yqx/LGzHLUIjGjsF1kKPysogDyG2vVY+8s+N8PTYhKPTyh4ACcyF24+wMsvDkWV
 HoMpNTIC+E6bYuB8fDaKiYToCjnyJy6T5P8ksA6DbiLXI/qy2awow9Wiy4i+9ico7tmr
 g6jxHMX3ONcndVRYk8KlG6vNoPIB1NwOrTcKrEG/xos8ZEWNISy0RXB0os+sLxmUtWNF
 mgBSgcXSWHi7HK7kT9NbcjuAFZmSoLbt447t0YfPcndqwk592RUbYmWW1b5IBWZnDxKd
 4tKQPDU3IsTlwgNvOBhPO3gCVZHDTNVuPZstd9pobY90Gnq6dtOLbL4656x9U1Qqpt1D
 D3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
 b=UAdbUP57KEm9hJu8e2vuw1dhY1njLKK+B6m3fyUpJkGdgiMHRfEqvcJWeJNCxVWwWH
 2W7KbM363+VLYLg61ZFOVoqrGsBkziIT8J/ChWh9tPWxthR9JXn/WEO2s8zNf77z6aRw
 FwQw63oX+t8mbigcCdpxE0wIvuWBmW4achh2IlIcLVDbmU2kX4BzROPKUWLZBsPFjfql
 RYqoAmHH0EwJSapYJFD+9tXPgrnE2Qt50yFp10VP6BX8slK87wet0CtKYLnf28Z8ykMC
 5EcuIowlVulmLbsXThcecthIoduHbHsm8al8r5NRl/BbfJ4vFjd3kUrmYwI7nipfACGz
 D+lQ==
X-Gm-Message-State: AOAM533kUqb+PEWun9rMmDxDJoD8l+pvEHb2TfRKvFKsbgpbEc0gUP8w
 L5q1E6ttS1R9xMWPO7NPD597rh3imci/VRXt0oE=
X-Google-Smtp-Source: ABdhPJyz+B9K91a/msM+dSi3tWDZXEiIxtxc7t7+Nz5WVzNWfdgNtM43dsiSzf+FIStCK900mQNbeVT/50ZkdTQrSrg=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr4407224edq.146.1603222460451; 
 Tue, 20 Oct 2020 12:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:34:09 +0200
Message-ID: <CAFBinCA+4c6pjYFx3MW3-G=rCKon_jUXQ77pYSxXpRE9k0mpAA@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] dt-bindings: usb: usb-hcd: Add generic "usb-phy"
 property
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_153423_768989_E39DA2F2 
X-CRM114-Status: GOOD (  13.35  )
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
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 1:21 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Even though the Generic PHY framework is the more preferable way of
> setting the USB PHY up, there are still many dts-files and DT bindings
> which rely on having the legacy "usb-phy" specified to attach particular
> USB PHYs to USB cores. Let's have the "usb-phy" property described in
> the generic USB HCD binding file so it would be validated against the
> nodes in which it's specified. Mark the property as deprecated to
> discourage the developers from using it.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
