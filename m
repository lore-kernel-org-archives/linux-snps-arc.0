Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9486C072A2
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Nov 2023 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muDfZEMW1MPp1d/7FOsNGqpjw+3s84WaL3rMaSpahBE=; b=ozDQvhBJmHlvtU
	y+HHZdK3K0gR4WRlb3oHk2Giv0PP+ffWxPfOYknbwJIcaMEkJluuh01aVuazOBmh/e7Ghd9vinZ8t
	7AqwL3WFqwLpjHnu87Z5o0GKuWh+gWCjKWNGrU1kx8wpL4wpy3evKPcjwV9KzdEFIvYewVd/QkRyn
	V9s7ivb/X5dx4+ixmmq+/3kSBIhWxK0FT20uy/unQij9d3kyTT2uyS9JZIPOrYaNlQrZRVdXtPf9h
	nxfLuD9IJJskhs+rUx8DUrE0GaAIULbWEyWsPOUnSe5aJz5vZN+AcWvxX4S+Cz/5sR5pMc8Gt3Dw2
	z0nrIPKk3VDljJ8upvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4ctb-009iAj-1a;
	Sun, 19 Nov 2023 08:11:11 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4ctS-009i9D-0d;
	Sun, 19 Nov 2023 08:11:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DD580447DB;
	Sun, 19 Nov 2023 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1700381447; bh=GM+if5fLHpvJrFY5qSih6je/CvwvPPLKRrXfiPD5JZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fnmZORRU99JAVouDyTggPcE3iI5afMoj+u2Q93VQ586jKo2M/q9GZEdwubNM4sfTG
	 O/GNq8IBB2FxoNxqr+83D6QLnNoyRUshU83ipS6MAOREVA4UCBzzO13RzDdjxIUQMP
	 eudSVW93AZc92wzpKNKzYiJbsCHq3HNLwf37Q4rYng+gvpQzwQv6Hir4FQs3pVEOHW
	 PWvxNrEeCr6uJqj6WxIZxJOcGOrqTmHPOFdam47KxGPA3SBUOixBt51uEWtRaaJNpU
	 +oztbcTSFkScA/2bBEJM1o2bzkZzy2rOmG6UsRBkmN8P7aMUR0GoioW59JerR3gTgu
	 E9BI6sjTeb8xw==
Message-ID: <20a7ef6d-a8ca-4bd8-ad7e-11856db617a2@marcan.st>
Date: Sun, 19 Nov 2023 17:10:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] iommu: Add iommu_fwspec_alloc/dealloc()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, acpica-devel@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Frank Rowand
 <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, patches@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>,
 virtualization@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rob Herring <robh@kernel.org>
References: <6-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <6-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_001102_700935_20AFEAB7 
X-CRM114-Status: GOOD (  24.85  )
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

On 2023/11/15 23:05, Jason Gunthorpe wrote:
> Allow fwspec to exist independently from the dev->iommu by providing
> functions to allow allocating and freeing the raw struct iommu_fwspec.
> 
> Reflow the existing paths to call the new alloc/dealloc functions.
> 
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 82 ++++++++++++++++++++++++++++++++-----------
>  include/linux/iommu.h | 11 +++++-
>  2 files changed, 72 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 18a82a20934d53..86bbb9e75c7e03 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -361,10 +361,8 @@ static void dev_iommu_free(struct device *dev)
>  	struct dev_iommu *param = dev->iommu;
>  
>  	dev->iommu = NULL;
> -	if (param->fwspec) {
> -		fwnode_handle_put(param->fwspec->iommu_fwnode);
> -		kfree(param->fwspec);
> -	}
> +	if (param->fwspec)
> +		iommu_fwspec_dealloc(param->fwspec);
>  	kfree(param);
>  }
>  
> @@ -2920,10 +2918,61 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>  	return ops;
>  }
>  
> +static int iommu_fwspec_assign_iommu(struct iommu_fwspec *fwspec,
> +				     struct device *dev,
> +				     struct fwnode_handle *iommu_fwnode)
> +{
> +	const struct iommu_ops *ops;
> +
> +	if (fwspec->iommu_fwnode) {
> +		/*
> +		 * fwspec->iommu_fwnode is the first iommu's fwnode. In the rare
> +		 * case of multiple iommus for one device they must point to the
> +		 * same driver, checked via same ops.
> +		 */
> +		ops = iommu_ops_from_fwnode(iommu_fwnode);

This carries over a related bug from the original code: If a device has
two IOMMUs and the first one probes but the second one defers, ops will
be NULL here and the check will fail with EINVAL.

Adding a check for that case here fixes it:

		if (!ops)
			return driver_deferred_probe_check_state(dev);

With that, for the whole series:

Tested-by: Hector Martin <marcan@marcan.st>

I can't specifically test for the probe races the series intends to fix
though, since that bug we only hit extremely rarely. I'm just testing
that nothing breaks.

> +		if (fwspec->ops != ops)
> +			return -EINVAL;
> +		return 0;
> +	}
> +
> +	if (!fwspec->ops) {
> +		ops = iommu_ops_from_fwnode(iommu_fwnode);
> +		if (!ops)
> +			return driver_deferred_probe_check_state(dev);
> +		fwspec->ops = ops;
> +	}
> +
> +	of_node_get(to_of_node(iommu_fwnode));
> +	fwspec->iommu_fwnode = iommu_fwnode;
> +	return 0;
> +}
> +
> +struct iommu_fwspec *iommu_fwspec_alloc(void)
> +{
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
> +	if (!fwspec)
> +		return ERR_PTR(-ENOMEM);
> +	return fwspec;
> +}
> +
> +void iommu_fwspec_dealloc(struct iommu_fwspec *fwspec)
> +{
> +	if (!fwspec)
> +		return;
> +
> +	if (fwspec->iommu_fwnode)
> +		fwnode_handle_put(fwspec->iommu_fwnode);
> +	kfree(fwspec);
> +}
> +
>  int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>  		      const struct iommu_ops *ops)
>  {
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	int ret;
>  
>  	if (fwspec)
>  		return ops == fwspec->ops ? 0 : -EINVAL;
> @@ -2931,29 +2980,22 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>  	if (!dev_iommu_get(dev))
>  		return -ENOMEM;
>  
> -	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
> -	if (!fwspec)
> -		return -ENOMEM;
> +	fwspec = iommu_fwspec_alloc();
> +	if (IS_ERR(fwspec))
> +		return PTR_ERR(fwspec);
>  
> -	of_node_get(to_of_node(iommu_fwnode));
> -	fwspec->iommu_fwnode = iommu_fwnode;
>  	fwspec->ops = ops;
> +	ret = iommu_fwspec_assign_iommu(fwspec, dev, iommu_fwnode);
> +	if (ret) {
> +		iommu_fwspec_dealloc(fwspec);
> +		return ret;
> +	}
> +
>  	dev_iommu_fwspec_set(dev, fwspec);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(iommu_fwspec_init);
>  
> -void iommu_fwspec_free(struct device *dev)
> -{
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -
> -	if (fwspec) {
> -		fwnode_handle_put(fwspec->iommu_fwnode);
> -		kfree(fwspec);
> -		dev_iommu_fwspec_set(dev, NULL);
> -	}
> -}
> -EXPORT_SYMBOL_GPL(iommu_fwspec_free);
>  
>  int iommu_fwspec_add_ids(struct device *dev, u32 *ids, int num_ids)
>  {
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e98a4ca8f536b7..c7c68cb59aa4dc 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -813,9 +813,18 @@ struct iommu_sva {
>  	struct iommu_domain		*domain;
>  };
>  
> +struct iommu_fwspec *iommu_fwspec_alloc(void);
> +void iommu_fwspec_dealloc(struct iommu_fwspec *fwspec);
> +
>  int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>  		      const struct iommu_ops *ops);
> -void iommu_fwspec_free(struct device *dev);
> +static inline void iommu_fwspec_free(struct device *dev)
> +{
> +	if (!dev->iommu)
> +		return;
> +	iommu_fwspec_dealloc(dev->iommu->fwspec);
> +	dev->iommu->fwspec = NULL;
> +}
>  int iommu_fwspec_add_ids(struct device *dev, u32 *ids, int num_ids);
>  const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
>  

- Hector

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
