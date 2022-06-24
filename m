Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F45C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9Im1XMBuUkXXR83zKf6r0sVG0YNFMOrJ//5MH0lm+A=; b=hMCh79jxTkazyJ
	q/E6gCbqzoYmARLsfi1UzWLgxhND8n+7lP73/kc2Jn2xY3W6tv6phiIm6crnyQpsyI/m7+8Ik8AX3
	rmGayENk0Xr2DQIgYlWKF6vmXo1uhrP7WjTe6EJjmCISUh5hExSInOht1N930gjKSxX338+e2FbMr
	yNUSFro15MQMvpm7ShLTRz1hrZjtLXzH2VIxLVP1LSIBVSUZUZNr2X15TtPjjkTlLOW+XUttObZmn
	tyYao1hQ8NoRDbku6mHmMnLkiWI0Ncwqk5SOo03VbWzKEfwpllGT9+JROAetvlfgW5Sz2tVVb8Ncb
	rCJyXuOx6baFrva2+chQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4q7v-003lXO-N2; Fri, 24 Jun 2022 20:42:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4q7k-003lVk-8J; Fri, 24 Jun 2022 20:41:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j21so6467592lfe.1;
        Fri, 24 Jun 2022 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/jG5W+ePlStAo427FPsgRmaP+U/0rD3zZzMdqRYYbmg=;
        b=J+tGRTrSFTb1R8Vpr8cSIVIm/o2Vqxs+I2fXmSTA2UCTtbWmE8Fg0sRokRImAhBYJw
         xq7CLvEwVzlTrLtsqp1g006ujV5OnJj6pfhLyOXJVcvgkrAaVPto4YFjTBaYYLnZklOc
         RvhVBLvpez2CY1JRQ9ku0JYimoPj+tDA9JkYdy9BkhyGCoZWIqk092HsH7cBc3aIziGu
         TkTChrOWEoXvt6JpnGete/IfDHoeui49vS+4xpjhT6JRSieX1d7duusa0LwdX9qk+Bnw
         AX5WP9DSydJ1DC6VDm1jnKdb1rbFKACQ2BUrbWYCFK32Rs0jp3v3FvMwz9aYq+5feFhg
         HGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/jG5W+ePlStAo427FPsgRmaP+U/0rD3zZzMdqRYYbmg=;
        b=sT/PQej3TCeRIVqk5vh3kE7hMtYppL0R4KqpWaTpW0JrJB43LuURMC6M80hxeChi7r
         S2lyuaf3XWZRyjcD6+5vqTEeNEhEe/spA3Haa83lqiBd6OYYA7jWCsJuotsXZ8QAbkNV
         viZGlyGtXJV5rthuZEcM0K32JoAYNcQwjH72RVw2mCp22oGolWAR8s0zNNBtYaRtCBZw
         JlHmw/UxyUNR/xLjPhsM1VMC8K/0E5a/7353JZoh2lSlXxZ02/TlQ3lOTR3pG8OsNnRl
         rKN4N4eVwoTT38NEXxtiMqk1hsZsTEtZZkGl5afI9JO4vejkOcYb8CE7rZHvmwTPU4HJ
         9P6w==
X-Gm-Message-State: AJIora+mQNJ2VusBKHNn5WlaE0KioauRDpPdg+RP6EYyC2NpcJpRaDW5
	dfILf0ot5l5KIXknWJplF1Y=
X-Google-Smtp-Source: AGRyM1uctHDCNUKjjxfR1aVDBN/pntJ2Pv6ctSxnvIPYmNdb7JIuhWvHsn1bfb+oEyhecmXfDr12sw==
X-Received: by 2002:ac2:5616:0:b0:47f:8d53:f602 with SMTP id v22-20020ac25616000000b0047f8d53f602mr419029lfd.169.1656103302868;
        Fri, 24 Jun 2022 13:41:42 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512314900b0047f88d15ec0sm506070lfi.251.2022.06.24.13.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:41:42 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:41:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT
 nodes name
Message-ID: <20220624204139.ndyi437ye7c2gl45@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
 <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_134152_352087_16B49CC2 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jun 24, 2022 at 07:14:44PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> > nodes are correctly named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--
> 

> You should split the patchset per architecture, because maybe that's why
> no one picks it up?

Each patch is sent out to the corresponding mailing list and the
maintainers. I don't think splitting the patchset into the subsets will
be more efficient especially seeing the initial patchset consisted of
30 patches of which only five left.

I was very busy last year with another activities so what was left of this
patchset was stalling on my local repo all that time. I have been very
surprised to realise that the submitted part still hasn't been merged in for
all that time. So I've got back to resubmitting the series.

* Though the Qualcom dts have been fixed by you lately.

> 
> Let me pick up ARM bits through my cleanup series. If anyone objects,
> please let me know.

Ok. Thanks.

-Sergey

> 
> Best regards,
> Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
