Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61323C43467
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 20:47:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CA9214DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 20:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJMkIPYf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YX9YE4pr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9CA9214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4yYMhGyJG2tl5U5RK3xNvMh9S0FZy8f+2zC5/YBOTTY=; b=LJMkIPYfdRmi8Rt3Hj1/R6eco
	hrDjIcW7JPJBYm9zUkae6Pa9DAxwGuIqWBmLi1qSkyU+x/jMsNn4RYGnnJOb2kY1gJkeSTWYZpTDc
	qBPZHoudDR0IqYDTnzJR3WXgHms2rOr0N1FUdjyyNI/PkjdfhXErw5rJrtlG5l56LZr4em64dctgI
	79sC0jyVO2PHLcQvldhVqLw4SdY4LwVSRJsIrwSdFHlzf6pAqjMVdiTAyBfHMxyqynEgdUAf6Qru1
	k9t9FdbErPW0brRN7FFWZhV3YFlitJPZTeoUQUd3yxLMPkQstrbvlQzPTlmdOc4hHPQBPSUnL9YYN
	tYVYcisUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWdH-0003xh-K6; Fri, 16 Oct 2020 20:47:23 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWd8-0003v6-Tq; Fri, 16 Oct 2020 20:47:15 +0000
Received: by mail-ed1-x544.google.com with SMTP id o18so3857240edq.4;
 Fri, 16 Oct 2020 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cM0Y06ICfSsoQ7UyBgP3+N66oWYmNuuTL9tZcHXPGCQ=;
 b=YX9YE4prYIppUA6bWnjFZ1SlFrt/2+Clwt/Y2HOaFsDQzC62RsyOpLMDHdZRq05zfT
 oI/clGG8Wwp2uI3zODlg24vIR8B/Htq8McDYf1W7QK3oGDMpWznzASoFSXWHrH01hjDt
 9XeAgl969QeMhMjdXEfAEqQaPDHxl/FTduIQvEeC4cnXu5e1kiWb/4hD9M41+uVV4cfe
 5H3xhmf8eHN0rg93ykx/fi1xUJpSXfnawqwK+EblahRFKhuHpDMu1dcksPXMovgNM1DQ
 fYO6fnu/GvwZsfRs2OdOMn3qipwnLIl6sZsuRxGMwuzH17TOHn5w7AdnOe24CHKjHgoF
 ZQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cM0Y06ICfSsoQ7UyBgP3+N66oWYmNuuTL9tZcHXPGCQ=;
 b=cvo5YEGSN+bpKLOU4XBbiBPrnPTgxct5CBT4muJohNkABmZm7bwYSX0lr4qUK3qx2d
 uE2gw6uoSWDqdd6TsCW7IadNuol+oeleLMep1Ch77V861Y7hmwVHHl9AXnDWTKcfv4QH
 +lmmW8nDhzJP37bxhrrCtP2WBHsmXF2ajmLAMgS53uAZOfH9+0OzKsZvt9V+lfCdO4m7
 FqHczBN9SDY76zEgeppA9e8AZVCUR9q7Lo+AJ5dlgJNKkdNsLI9q/cz8VTQpZDpZkt5U
 rbhDNsyBDqtKHTNuQHV4qKuMq4HnSm3+Smzp93ati/AouJn0KXozdeEHQNxNrjZXQIIJ
 h4Qg==
X-Gm-Message-State: AOAM533XJL1nDCSvv9eGugGJIbg4QVY0q5VrTdRicr5vEW+iD1U9j9hy
 0QpIxzyzDhGUwxEZzUiuEptUcDwI8IV8DgqBNv0=
X-Google-Smtp-Source: ABdhPJyY7U/2059vdl/trPuz5QmTks+M1tCJlzB3pZYDFJT8/0Yi++X7QL+PvBI+5qrHrP47VENdS6ZsuDkZG+Z/RX4=
X-Received: by 2002:aa7:d690:: with SMTP id d16mr6142313edr.301.1602881233657; 
 Fri, 16 Oct 2020 13:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 16 Oct 2020 22:47:02 +0200
Message-ID: <CAFBinCCRobE1kQhUrh3oorQTKcQZwYEJ_MaHRtr=f=sYFCoD8g@mail.gmail.com>
Subject: Re: [PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164715_008233_8592C60D 
X-CRM114-Status: UNSURE (   9.55  )
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
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
