Return-Path: <SRS0=cm7l=FK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580A1C433FE
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Dec 2020 10:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF0822D0B
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Dec 2020 10:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF0822D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t2XweozF1vs+RBVjdz7CMB4o/gr2/w8cIPCIYGGUf+U=; b=mlu0Pqb3D/Dj+8XfCltWbS1Fw
	enfjfAsrksRJ2ecdb5WcnkzpeDAD0pabs4wR5C5E5cGOmezDYa6GfmL7bajotS5zUaRQb1Jvpp9Y6
	dLV3kSPR16ApQ5emKwlOoorGUQCAP8ZqxS5gDEvqBS+Qd3vC1o+o6SZ+SQyCIDeZ2jaQk76niDaWE
	4ialqVRO18GGOW0L1aqf6EnhC9JXU0IMQ53aCrs7PpjmdTWxSXJA+7bQiHyITooOvK6LF5TIJfNnw
	78BfxbjhXAQOhLX00Tzd9f6EOBvFwTkfcGl45qAK/5k9G0WYpmtf+1F90V5yV0vYA1kDmpRuK6llt
	icXAiEwBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klqvb-0001QZ-29; Sun, 06 Dec 2020 10:06:03 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klqvW-0001PK-10; Sun, 06 Dec 2020 10:05:58 +0000
Received: by mail-lf1-x141.google.com with SMTP id l11so13817532lfg.0;
 Sun, 06 Dec 2020 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xt68N/tojAn+X+eORxYIydzyuDkBvWrZkEpf49UU+Ws=;
 b=QustGC5gJezh0xNL/1XUtO+dCt5J+pvT7fp6FxldwuvmTZLa7CA93Y9b3RdoAJUE/T
 g0xIlxWJtXakl4UKiYwvYrJzdR4FMeXEtFrsIzZXkN9FuBTT1ruQEuznJf8QF+n8XBXL
 wpDjtR4HHi5UVz2iOJeC8+a3jBkvMPWwpc6dI8s91lpQ2HrEfJVGY17ccj59XvsFhPX3
 RKftikG2ho64wVjuTMMB3FDXGtU5B82ZSdJhdfMQa/J/Z4QBHTc8Y7Y6HQJNYbUzzzPW
 umgRjuMQFqpjcwNNAsX5ZyKvaIVlk8PJgtkdvWV6jiVv0ZNd/HB3HM+UJ3+RaPZRhrNw
 PEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xt68N/tojAn+X+eORxYIydzyuDkBvWrZkEpf49UU+Ws=;
 b=Fkyo5zDA1UjstXI9rRxiKFQY5gCTb7o5qtCMIWtSS9NJSTYovLdUwHc0PBDSEscX29
 3RqFTM6+hxWgdkPcTw30PGRipmrD6zQkMqoMNbF4+yvKD6T9aX0BiNFFwBPiFGQCur2u
 cNnX/GKRAG6L7UfetaaM8T2vTV3H+5RXdlFguaKfL2WxvF15N8Xs+A9/s74dZuYENkEo
 xSUxXyDtq7zG6MQkQR7h71ywdc5MrYSkZ0aFrkVUbxH99xU7K7QzZKPL5kkWK7P7PX3u
 mdjZHa00y9+7Qahm609atrFUwJ/FF/MbmVqF6UaeEztSO2orx7W8vIVB+5P7kuw+GdQ1
 IwYg==
X-Gm-Message-State: AOAM530GznQdvZ7lrEB8JSzhwhlHyJZFLM+U2z4zgjkM5xBcXMG5+/eX
 BO+XOMM2Jd1AJ95w//h2kb0=
X-Google-Smtp-Source: ABdhPJw/nG2Sxcwi0lQk9dQrxf0vxOmbyiTRrngGMSbpQGeRGfcRhdlBhixGcs00B/NGWV2nb7r2dw==
X-Received: by 2002:ac2:5a44:: with SMTP id r4mr5837652lfn.1.1607249154606;
 Sun, 06 Dec 2020 02:05:54 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id m16sm2498255lfa.57.2020.12.06.02.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 02:05:53 -0800 (PST)
Date: Sun, 6 Dec 2020 13:05:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
Subject: Re: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
 DWC3 sub-node
Message-ID: <20201206100551.7ioybhtwfscul7kw@mobilestation>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
 <DM6PR11MB3721E8FEB4E755328D7A517EDDCF0@DM6PR11MB3721.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3721E8FEB4E755328D7A517EDDCF0@DM6PR11MB3721.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_050558_186134_C7EEDC38 
X-CRM114-Status: GOOD (  22.00  )
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
Cc: narmstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Nyman,
 Mathias" <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Wan,

On Sun, Dec 06, 2020 at 09:56:47AM +0000, Wan Mohamad, Wan Ahmad Zainie wrote:
> Hi Serge.
> 
> > -----Original Message-----
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Sent: Saturday, December 5, 2020 11:24 PM
> > To: Nyman, Mathias <mathias.nyman@intel.com>; Felipe Balbi
> > <balbi@kernel.org>; Krzysztof Kozlowski <krzk@kernel.org>; Greg Kroah-
> > Hartman <gregkh@linuxfoundation.org>; Rob Herring
> > <robh+dt@kernel.org>; Chunfeng Yun <chunfeng.yun@mediatek.com>;
> > Wan Mohamad, Wan Ahmad Zainie
> > <wan.ahmad.zainie.wan.mohamad@intel.com>
> > Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>; Serge Semin
> > <fancer.lancer@gmail.com>; Alexey Malahov
> > <Alexey.Malahov@baikalelectronics.ru>; Pavel Parkhomenko
> > <Pavel.Parkhomenko@baikalelectronics.ru>; Andy Gross
> > <agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>;
> > Manu Gautam <mgautam@codeaurora.org>; Roger Quadros
> > <rogerq@ti.com>; Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com>; narmstrong
> > <narmstrong@baylibre.com>; Kevin Hilman <khilman@baylibre.com>;
> > Martin Blumenstingl <martin.blumenstingl@googlemail.com>; linux-arm-
> > kernel@lists.infradead.org; linux-snps-arc@lists.infradead.org; linux-
> > mips@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-
> > usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
> > DWC3 sub-node
> > 
> > Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC
> > USB3 compatible sub-node to describe a fully functioning USB interface. Let's
> > use the available DWC USB3 DT schema to validate the Qualcomm DWC3 sub-
> > nodes.
> > 
> > Note since the generic DWC USB3 DT node is supposed to be named as
> > generic USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-
> > nodes name regexp and fix the DT node example.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 

> LGTM. With minor change to fix the typo above, Qualcomm to Intel
> Keem Bay,
> Acked-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>

Ah, right. Thanks for noticing that. A probability of copy-paste mistakes
increases proportionally to the number sleepless hours.)

-Sergey

> 
> > 
> > ---
> > 
> > Changelog v5:
> > - This is a new patch created for the new Intel Keem Bay bindings file,
> >   which has been added just recently.
> > ---
> >  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/intel,keembay-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,keembay-
> > dwc3.yaml
> > index dd32c10ce6c7..43b91ab62004 100644
> > --- a/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> > @@ -34,11 +34,8 @@ properties:
> >  # Required child node:
> > 
> >  patternProperties:
> > -  "^dwc3@[0-9a-f]+$":
> > -    type: object
> > -    description:
> > -      A child node must exist to represent the core DWC3 IP block.
> > -      The content of the node is defined in dwc3.txt.
> > +  "^usb@[0-9a-f]+$":
> > +    $ref: snps,dwc3.yaml#
> > 
> >  required:
> >    - compatible
> > @@ -68,7 +65,7 @@ examples:
> >            #address-cells = <1>;
> >            #size-cells = <1>;
> > 
> > -          dwc3@34000000 {
> > +          usb@34000000 {
> >                  compatible = "snps,dwc3";
> >                  reg = <0x34000000 0x10000>;
> >                  interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > --
> > 2.29.2
> 
> Best regards,
> Zainie

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
