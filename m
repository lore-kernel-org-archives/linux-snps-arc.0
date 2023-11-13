Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172C1C4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Nov 2023 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSt1J8B448bTYM/OyIPp9GCwRbTiwC5r70wUJDS1wM=; b=Eufq09/umIMClk
	HEw2+04hy6GDaxukt6mwX5fznYtEUrRI4gQxMktIvs+qfI08UlfAi6AD0n/Jc4FkNss3R0Nvo/rU5
	YJD2s++oCMURYP18MIH7uBbjsVnO52LNTtiZ7aLG90F+k3nVTjhAhS6r1WGTYaWFatN4vakz1pTNG
	GtKownDku7jjAu0fNtSs8bwOyBOeidddTvDFgDOr/TCIhJmqT9/58sYiC0glVvjfrO9VB/qUMFhiL
	gy0NlSgLmtEOFd/HsS604Y0zpfgawmrtIK8Ld+x9o48aftXmKVEzeDsBwzlV5Zsgbwn8QrDYLnq25
	qK98Q7twdh6xwwIXAqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dIY-00Edjr-2O;
	Mon, 13 Nov 2023 20:12:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dIU-00EdhY-1l
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Nov 2023 20:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=Hm4gRkCBuIO9rmOii3qGBKiY2plZL5PcCwmmp7SN/T+J1tLfgYnvCmGz43FSmkwPF+dJy5
	PM14dTgEOMqc+QehedM7btPN5Gl5eHElUYTKgE773fxtgBZAWjHT58+n5vNsku8UeDHKX2
	pi/oCIxSWN25n2Dzg4bgjkKK/7D5C0E=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-u5aROoDmM42Ms-OJp9B7YQ-1; Mon, 13 Nov 2023 15:12:36 -0500
X-MC-Unique: u5aROoDmM42Ms-OJp9B7YQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5a7bbe0a453so56655497b3.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Nov 2023 12:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906356; x=1700511156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=hKnd2FMB7vD02eUDhvZiQREzHscH9QW2QiCZRSWXcTgSNCVoN3IyBxQFk9tpb97uo5
         BGS7SS7+GCMJNctXsmQXanR8yZ3iNJRTnGDoSzAfW1Wu7ICDabskn49SJoBWRZ/4dQwa
         H31Er2oqUSbjmh3+ynS170VX+GEZysbvzW4Na5rEKsk1yGtQc80oeacgNICB9By0D2ex
         jScOUJ1KqswEt7m4bfL5UqKAGRzacv7CmClH65G9MShwjCxuEoRQLx0FKy7SeO/yKSSB
         +3hwO2fFfEPqEK+b29yYm4aRQc0k6NZ/4o4XLZ7ysYiVLLF0MMRVdfaXBKkplb3Ui/N+
         bi0g==
X-Gm-Message-State: AOJu0Yxcuicv43uW7Kcj2KPmFrdLm7DvNjEqzvYyniKkaQZDyY2cJtg5
	wIJmbIcbhM6Q39j55FnV3s1pgfMLb2XWdlWD0vXetnuUw2TziTR0G7+orWctWrj3F4yFZR8IlDA
	RtPnwcYhxW5z7cfxZycYz28CzM0k/EvEG
X-Received: by 2002:a81:a1c8:0:b0:5a7:b8e6:6441 with SMTP id y191-20020a81a1c8000000b005a7b8e66441mr5681655ywg.16.1699906356192;
        Mon, 13 Nov 2023 12:12:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8TAFaS4ERYYFs+8jp6ZPsOwc5cP1r90IboZbxfRfwy6gwcqiZWRR9jIiN36BiWY+6zJFv5g==
X-Received: by 2002:a81:a1c8:0:b0:5a7:b8e6:6441 with SMTP id y191-20020a81a1c8000000b005a7b8e66441mr5681632ywg.16.1699906355905;
        Mon, 13 Nov 2023 12:12:35 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a10-20020a0dd80a000000b005a7ba08b2acsm1972894ywe.0.2023.11.13.12.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:12:35 -0800 (PST)
Date: Mon, 13 Nov 2023 13:12:34 -0700
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
Subject: Re: [PATCH RFC 09/17] iommu: Add iommu_fwspec_append_ids()
Message-ID: <xv2544jtubq5aefvzaiabazmz5uf32alw6blcdbvsui6wn37ep@vpykzk2vvyp5>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <9-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <9-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121238_658934_E0339B50 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
