Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1B1C4332F
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Nov 2023 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUuO23mFNCbqYyUeom57IZ0sKRCE4hHcw36q+7N1GqE=; b=DnxM1cbXCj7C4L
	t1OJ+dgHfsnoufWfjNiAiURiHGvE9RkGOsQ2lvufhcV9Q6v9Gw4zOk69+1/TY6bWgyXEDTO8OJyq3
	1e+2PQRule1igCSyDuaGh0T6xon5/xlRD1H59Th07KVXStJxCiwwUhazzkYBaHSIdbjM5txjzJ5fp
	txzBuayg8rdrZo6RygsZNDwIqM8gctUbF7yfdwe8Vs0tO2467Vm8fXn+m2hSLdA41Gt3SXjt/5Gnc
	dmW8x9LOL1bn4hFq4Dz2c/h8rxDOaY+STCjn+WXqyqkO/DU2gouerkRblvKtgONP4FLNsQ5MvFUEf
	+JwzUvJ6PqvtqwnsWiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzhLd-00FMqP-1Y;
	Sun, 05 Nov 2023 17:55:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzhLZ-00FMok-2H
	for linux-snps-arc@lists.infradead.org;
	Sun, 05 Nov 2023 17:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699206938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fd/39Q+ldoVf5VWKnHQ/ghXrqcDy2syROa9KrYZuz/I=;
	b=SmtXGb4zEhdqTtBIY0mn9aLJdu41jLzPYYne7y2AUpyv/5Gd0+iWVNKb+9/jV7OwrbkWwc
	fev9NZvavtwnxsswgYfm/uGNyUSwxrdoGrTxGTKEUK8W/rtTRAWbBB1zD5D700JtynNlPP
	I1Evs3C7/PhSobDf/flY7TwlEwQ1tac=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19--Stx2SkbPduY47UDwvNo-w-1; Sun, 05 Nov 2023 12:55:37 -0500
X-MC-Unique: -Stx2SkbPduY47UDwvNo-w-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6bcefd3b248so3750941b3a.3
        for <linux-snps-arc@lists.infradead.org>; Sun, 05 Nov 2023 09:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699206936; x=1699811736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd/39Q+ldoVf5VWKnHQ/ghXrqcDy2syROa9KrYZuz/I=;
        b=txTt1n2YoL2CxDwA+Gd7175iyD2wI8p5zk//CiHnw547O9kSzyYYiXSCoPtHF5lxhG
         p98lk58kwhv13D38c+42eNSLK8Mjvlx6nRVlJodUzlEqZc8HSznHwuGLDN8T+eyuFWbI
         9x0xWhyDUjkxg+KPGRzevtMUD9JDR99d85Rs+SjVMq4iRl/x/mHxcPjZY9SmYISKVqbg
         0VzUT0hijAGm6tBljTXhh2tBOQo9b/dIbxzg36MFeLOIgAGR4earKhwvpiltkSghYHWS
         8m/Qp2HIlcR1OIvoMNwqSNHhqSNUXdYMrp0mru2OzbHYGAs2ka0RqucU+tp+71Vz8s/R
         BuMQ==
X-Gm-Message-State: AOJu0Yz2hz4XzfNrin0viWVO2ZnQ9jG96A9sng5vptR3KxjnbnW4jTNC
	CAahDU6Vx361ZOyZkZ/NwhC6MAf5IL3B68NruUzSDT/1UsO/HzGi6f2tRDEcg5m9pUnegnh1u7/
	oc4PLqQ58E/VKAug0SrmprK++NXE+zQ1S
X-Received: by 2002:a05:6a00:14d6:b0:6be:4e6e:2a85 with SMTP id w22-20020a056a0014d600b006be4e6e2a85mr36240610pfu.30.1699206936720;
        Sun, 05 Nov 2023 09:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk2pBjd4CJ2rMONJoZ1WOco/rxQ9zWrHoyH1EeQbHLv9sJvLzIuEzeP3ARVcsr8N00dE/hMg==
X-Received: by 2002:a05:6a00:14d6:b0:6be:4e6e:2a85 with SMTP id w22-20020a056a0014d600b006be4e6e2a85mr36240554pfu.30.1699206936324;
        Sun, 05 Nov 2023 09:55:36 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id ff7-20020a056a002f4700b0068620bee456sm4312142pfb.209.2023.11.05.09.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 09:55:35 -0800 (PST)
Date: Sun, 5 Nov 2023 10:55:34 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 04/17] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
Message-ID: <oe2b62jjtcki7ti4qw6ktzvat7eszrpm7vphgsdvfp5uwdoj3r@wc62cpauchw6>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <xvgdxrlcpvafst6qypgwehtleaihsedgoiat6akv6au2j4xrjw@rk4dl4xbnq6o>
 <20231105132409.GA258408@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231105132409.GA258408@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_095541_832596_F64A956F 
X-CRM114-Status: GOOD (  14.83  )
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

On Sun, Nov 05, 2023 at 09:24:09AM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 03, 2023 at 05:48:01PM -0700, Jerry Snitselaar wrote:
> > > @@ -1632,10 +1633,15 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
> > >  
> > >  	acpi_arch_dma_setup(dev);
> > >  
> > > -	iommu = acpi_iommu_configure_id(dev, input_id);
> > > -	if (PTR_ERR(iommu) == -EPROBE_DEFER)
> > > +	ret = acpi_iommu_configure_id(dev, input_id);
> > > +	if (ret == -EPROBE_DEFER)
> > >  		return -EPROBE_DEFER;
> > >  
> >                 return ret; ?
> 
> Maybe? Like this seemed to be a pattern in this code so I left it

Yeah, it is fine. I think it just caught my eye, because of this earlier
bit in the patch:

        if (err == -EPROBE_DEFER) {
-               return ERR_PTR(err);
+               return err;

which needed to get rid of the ERR_PTR.

Regards,
Jerry

> 
> > > +	/*
> > > +	 * Historically this routine doesn't fail driver probing due to errors
> > > +	 * in acpi_iommu_configure()
> > 
> >               acpi_iommu_configure_id()
> 
> Thanks
> 
> Jason


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
