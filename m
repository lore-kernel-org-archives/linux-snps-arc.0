Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7293BC43457
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE67D20FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGSin2fZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE67D20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Up2usGztyrXqbUudEfkcqYSw04saXorXjjhuEWLgdXU=; b=QGSin2fZtV/EbS98pbjSrtrxU
	SMtjWJkLJnt2InJpzecGQdPjqfj1qZSvz0GAPPT23Dl63KUhlrE9xnnIjcGdzQ6vD9D//WfRVXw0/
	ZWEci/l3P1EAua5Iaru/qqZIIvuj3ApRiUw3/Ape3YWDJXuQ6Op1neqqnZKUb9zsalCxEo78RV4mJ
	vVd8Fgq+SdcX78ab5M8FLQEDB0eDqxWKnKhN8XFMS8ZdIIUyDBOUCDxmWjP/AavIcy66LIMV5JOjX
	Ph4C2c5h0inAO7vo13BHDNg+oXcgZyaYZkY0Z692a2LJ/MN4un8/bc6VXhW49pqzP1Ez8mCkP35FA
	9LMOHlYHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUtI-0002LR-Pn; Fri, 16 Oct 2020 18:55:48 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUsa-00021z-06; Fri, 16 Oct 2020 18:55:13 +0000
Received: by mail-oi1-f195.google.com with SMTP id w204so3588180oiw.1;
 Fri, 16 Oct 2020 11:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TGrH8tVmrp2DQwkSPaPH+x2TeW+bXYbWOYv8P0MTPiA=;
 b=dGnN7XD72iuq0YOye6uKmPRBnwS/rx13YbJLUBxVkpCUhOboERKncunCn+Oj47tmDW
 gjnvKYOAwaTq5v6wT2ryFlg2HydBbzydcc7gNaylP991p+5aim3z+kRHTM+9h7P+VbXp
 CA3hu9gXffk63RFWymtJosiNlJikrCf97fQjxP0NCJleeL5twIw7S8qAG7d491NEOGLA
 KgMNak58l9FThrjZnUGuKKc7lK6WglODRufwNbfDvBb0PaBZZ+3hBnw8mEKLMs0kwAnF
 vb04BBqUjGPkLYco5/8BtYhHc8VOvy3xrLQGRfDLblmk3xwaW1N1RZX0f9OI+3u7++BH
 dRLA==
X-Gm-Message-State: AOAM533Lp3P0S4TlmiY47QIz9QS40Nj83C8jR2lhG8P1tXp49zmWZxrY
 0ikYUzAcEqKkP6xetJQmlg==
X-Google-Smtp-Source: ABdhPJwnZgFRvBDy/tFBiG5qnk1HDuFUgcTqyGaZJkTAhrpV/gkKkosLe8nlbRQyokQSpe8q3F4/vA==
X-Received: by 2002:aca:442:: with SMTP id 63mr3220005oie.111.1602874501767;
 Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y194sm1266324oie.22.2020.10.16.11.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: (nullmailer pid 1740583 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:59 -0000
Date: Fri, 16 Oct 2020 13:54:59 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
Message-ID: <20201016185459.GA1740536@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145504_561415_E2A5DA4C 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 13:13:57 +0300, Serge Semin wrote:
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> ---
> 
> Changelog v2:
> - Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
>   properties: compatibe: ..." statement.
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
