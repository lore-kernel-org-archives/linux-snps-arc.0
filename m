Return-Path: <SRS0=A0w3=FL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFF6C197BF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 16:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CE323787
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 16:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50CE323787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J8Y5lwSPn/ygQYXVozHkncDlh0NM4gB/CuaqjE954WA=; b=twcIyOMoDDrdsn0tWWwlsyf3A
	GaVdZHKu5C6vBSezJZtkVBxcxyxVkrAqyyUchsZri0VX5wKjmvbzYK+OCIJ2sEipMBjycSRUebN/n
	+QJUZJpvnUWQ11mM/wI+bNFQz/R3Oz3KXjGm6JMrlnXr3rbu3+8lS8FCu3+XL6J6+bqe+7h3EEala
	6l/If0AxUyiPOBlWKAt1qAVxOaMILz9okXPU2+I3aK4E3XvlH4Vt9KmGOrFWqaWwqbHA0iaZkkrRz
	HpBCWpn/vo7bAeJM5+ML68x1VoV+2XPtMkTij81b30tdCZyiMhpMg6WL6hubSSkX9U+Hs7aIWM1K/
	mFhdr0EwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJlF-0004xz-Lb; Mon, 07 Dec 2020 16:53:17 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJlD-0004xC-75; Mon, 07 Dec 2020 16:53:15 +0000
Received: by mail-ot1-f66.google.com with SMTP id b18so13104148ots.0;
 Mon, 07 Dec 2020 08:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7U3Yhw/pl02ZoaOBu+HcEPYWSZaSb6JEpp9JpxVMzwM=;
 b=BdGbgnk85/VHewm5K5MI/kyM4pdOwugqjBOGs9mDLYVopNvqsTNbi/rT1CCdE7PyEJ
 Ind3CpxHHPzW29BqclVW4vcludLRI0lQWXJ1jtMO7QwJYpZEmmnRsKqzLVOOMP/2qBCj
 SIfDkRy3+q5dDk325lOmJPAIAoCzYycx8zXKTXcXj0vhR5THpQTOeh0ieSYahelxUBJ8
 B7SNgIxWHxQQJ7TLe1wjm7mWAPzG+LTL/jTcleE/edEiABuzPUUv32/k9u++2gioMfej
 bUUiS7c5+QlfjS5D46LMcbvxOgOcICssPZwav8B8SqcltM/r/Do6j4P0cE1qhcBKyefz
 x19Q==
X-Gm-Message-State: AOAM531bKzu28qUGc+XduRKxS1CSLSx1ZzgylCQdvTQc3L4O/VLWB/oA
 AKKnn0US6oZbsAkG0OQKnw==
X-Google-Smtp-Source: ABdhPJy7Q0USqnNLm3yD6fipjmEKQhCRZjQyZNGy1bziDJf63sFl8UXBj77WW4CCsAJh3BBAvF6/3A==
X-Received: by 2002:a9d:6b88:: with SMTP id b8mr13781346otq.60.1607359994430; 
 Mon, 07 Dec 2020 08:53:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm2754514oth.16.2020.12.07.08.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:53:13 -0800 (PST)
Received: (nullmailer pid 425824 invoked by uid 1000);
 Mon, 07 Dec 2020 16:53:12 -0000
Date: Mon, 7 Dec 2020 10:53:12 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 19/19] dt-bindings: usb: intel, keembay-dwc3: Validate
 DWC3 sub-node
Message-ID: <20201207165312.GA425775@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_115315_294211_7867DCAC 
X-CRM114-Status: GOOD (  13.82  )
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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

On Sat, 05 Dec 2020 18:24:26 +0300, Serge Semin wrote:
> Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC USB3
> compatible sub-node to describe a fully functioning USB interface. Let's
> use the available DWC USB3 DT schema to validate the Qualcomm DWC3
> sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v5:
> - This is a new patch created for the new Intel Keem Bay bindings file,
>   which has been added just recently.
> ---
>  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
