Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C978C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 22:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gRew2UWBqdCVwI5xmGuz2LboiSXgRKarbo4iYohkLc=; b=QQXATlOHCYQbTk
	mL8ar3mOOejylZeDStnQ1IjqJN2QegrW2TXJ4Cghm1C1u6P2v6k+EKGe2bOO0c1wF9nLAWNaaHc2J
	uAQCd71vi0dFw1XS/wd8wnkBCQ6SVOPQUju/WLrIZRUuu7arl97h+YEgpmg/j5EVe3ijL65Yy2gug
	2T7w1jTQ8VcrJ/3MLTw7nd3xbfKNcvlVk+50FYOjIyMNHTV25msFv7ntn4ZSzon5iGqVNAOkfSZTV
	SrgDtpEH9C3Jm2ragzSA/DPGpYAirKNwWUR84IhX1lWkEQ85b3YSw0g4ROzlrOLosnt+a7rmBjcli
	J+ww4g3LPc3Eoleouosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4rn7-003zMy-Oa; Fri, 24 Jun 2022 22:28:41 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4rmx-003zKD-DV; Fri, 24 Jun 2022 22:28:32 +0000
Received: by mail-lj1-x229.google.com with SMTP id o23so4256997ljg.13;
        Fri, 24 Jun 2022 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M6TdAKBeetFQMmcnXoWXDBN9CpxYrPuj3DRX2P2Szoo=;
        b=Bgx80xNdrOeU9JzOMlCo3jmGu3eQEekyMqjaaQaYKMst/DnrKcGb0EE1upc7kKT8P4
         K54FHhsRXWGYw/bc1J8YMZjeG/8AiSgtYmwnI6mfwkpdX3qvy9niezyBABlqVlTdDv03
         SA+kUOtNjI2FmmvlsZORBRGSAkWAETIKpgqcYPA5tGdwxtl10+UD0RHwwxbFI3oVsb8c
         liFraUMYDWhxgIHIm7mhId9Ea+cmAHr8yUX5fRN0NMwOQNKBipnBwBpuM10qkVNClQKS
         oDA3vxhA6o1tuWr+qxufLUEBgxvZ5J1mdjVi5AQATam+lJabiaASH8u48UBhCA164Kip
         pjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M6TdAKBeetFQMmcnXoWXDBN9CpxYrPuj3DRX2P2Szoo=;
        b=nUr7tAoh+WtRIlYMt2oKCXBtCchiNujtt9YeeRJ5Bu3srosufTxo/nYFg+4vBSefxK
         gapb7GDaqEGNC8tUwYl//Az2+D9HDt81MCE91SfswZYbV0Ae/3p7it1NQvGLOdgcykBu
         GQ7fQ+rpgGLSHthubZHG4xVUnZfPPVgy92eaTeUAYjijPgZREmH6n/pPbLjUjICjHXNO
         +23yXMsban1KCqYhJuv0s/I0icvlWoNK9tts4zJUc75PCD7qm+wHaEWXa+yr5CiUN7uF
         lL8KEGsKRjOPD2NWzzrteDD3I4vxSNG/B9mjN8BPOdsxgqBauvP0+TX7AlRU1zhdmi7h
         IN1g==
X-Gm-Message-State: AJIora/l4BWExnB2Vg+i52AD0qnDXOmveq96o0r+l20vnpkfxY2k4/BQ
	n3WMeMoaqlLnC/8YWRPNV158aYAJvyD4HJv8
X-Google-Smtp-Source: AGRyM1ve4VS6aD8h/ThKo8NNZipID8rOImhCMDMlHauNTgrARt80UIm1/HNQbY9Ll1kMIrgffG9rkQ==
X-Received: by 2002:a2e:91c4:0:b0:25a:7256:a7aa with SMTP id u4-20020a2e91c4000000b0025a7256a7aamr559661ljg.344.1656109704289;
        Fri, 24 Jun 2022 15:28:24 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id o23-20020a05651205d700b0047f62762100sm553545lfo.138.2022.06.24.15.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 15:28:23 -0700 (PDT)
Date: Sat, 25 Jun 2022 01:28:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
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
Subject: Re: [PATCH RESEND v9 1/5] arc: dts: Harmonize EHCI/OHCI DT nodes name
Message-ID: <20220624222821.552zhh5yqqhdzmca@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-2-Sergey.Semin@baikalelectronics.ru>
 <53402d57-ee3f-59b9-a8dc-59fa659f3662@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53402d57-ee3f-59b9-a8dc-59fa659f3662@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_152831_497404_D4AE7F18 
X-CRM114-Status: GOOD (  10.52  )
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

On Fri, Jun 24, 2022 at 03:11:43PM -0700, Vineet Gupta wrote:
> 
> On 6/24/22 07:16, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?"  . Make sure the "generic-ehci" and "generic-ohci"-compatible
> > nodes are correctly named.
> > 
> > Signed-off-by: Serge Semin<Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Alexey Brodkin<abrodkin@synopsys.com>
> > Acked-by: Krzysztof Kozlowski<krzk@kernel.org>
> 

> This slipped thru cracks. Now on for-curr.

Great! Thanks.

-Sergey

> 
> Thx,
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
