Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A147C5ACB3
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Nov 2023 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLKGX3Gjfr9P6MMc1UfV8Trg/bBhpYZjZULAbw/l5qA=; b=D95GOBFjCI3j9x
	NV4qfQD0sz0p22o3IDzYDTnnkyPXxnjs5lAjthuVXH5NiHLf6T77aVyr42L2I9P7rI7UcYUUkg9b0
	8+Ju5uae0k9PyZeM97a1styH2c5RqaqWVAn1kQGCwCjj+3jNJ/aJ6HiRM1xBeSL77CBa/VvXTfGLh
	PYNsiew/kwIDOa7NBLL2eTlUpoipBXwlIL2ogsyOE74SW3Ba95jDf2ULQg0x5h27tbpNjDzIX066y
	ybXqCsFabPIQcHGMFEGRRyrQEWcaDz389nQmXYioigTUM+aTyOcIyGeq1yBrINSQ/Bo1ILfXxdDOS
	9STPMEvxUsMXeiR48n/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4dyO-009mUO-36;
	Sun, 19 Nov 2023 09:20:13 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4dyJ-009mTI-38;
	Sun, 19 Nov 2023 09:20:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id F0C7145037;
	Sun, 19 Nov 2023 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1700385600; bh=v2TCssYCBYtNkHs+VM+LpzhdZ1ldfOyFyouChbFTIb0=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=j5HQXu3NdqP3j4hmmEYGvyTELZstrnmLjBeVBgja8jWlFwAWbLAaxkb0IFb8dUFUK
	 ylbXySSxV1rdJR+wJze95Qt90P0M7495kVU9Rclj09OlY/3gTapM6o+a7yMGquvDrj
	 jogCad7hJ0YxEq2lCadFZuOqgnAHWGZqEPquhUD+tpGdDxlMyokgqWElnJKSqVGPuf
	 7YKStcVS6Q1zhTQs2BqQ4oa9bPc/MaxwID8Uk1BvmlMaFcdD17R5kgVChd2mfuZNaS
	 4UMOvg4Sv0ZGRmpiakFrt9NYotUw6oUoErgST5qhuAyBWf4sb+HUWpXpVBG4l+Bu9g
	 UMaF8SjXVR4cA==
Message-ID: <1eb12c35-e64e-4c32-af99-8743dc2ec266@marcan.st>
Date: Sun, 19 Nov 2023 18:19:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] iommu: Add iommu_fwspec_alloc/dealloc()
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
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
References: <6-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <20a7ef6d-a8ca-4bd8-ad7e-11856db617a2@marcan.st>
In-Reply-To: <20a7ef6d-a8ca-4bd8-ad7e-11856db617a2@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_012008_427727_F2DFB49C 
X-CRM114-Status: GOOD (  30.21  )
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



On 2023/11/19 17:10, Hector Martin wrote:
> On 2023/11/15 23:05, Jason Gunthorpe wrote:
>> Allow fwspec to exist independently from the dev->iommu by providing
>> functions to allow allocating and freeing the raw struct iommu_fwspec.
>>
>> Reflow the existing paths to call the new alloc/dealloc functions.
>>
>> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
>>  drivers/iommu/iommu.c | 82 ++++++++++++++++++++++++++++++++-----------
>>  include/linux/iommu.h | 11 +++++-
>>  2 files changed, 72 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 18a82a20934d53..86bbb9e75c7e03 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -361,10 +361,8 @@ static void dev_iommu_free(struct device *dev)
>>  	struct dev_iommu *param = dev->iommu;
>>  
>>  	dev->iommu = NULL;
>> -	if (param->fwspec) {
>> -		fwnode_handle_put(param->fwspec->iommu_fwnode);
>> -		kfree(param->fwspec);
>> -	}
>> +	if (param->fwspec)
>> +		iommu_fwspec_dealloc(param->fwspec);
>>  	kfree(param);
>>  }
>>  
>> @@ -2920,10 +2918,61 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>>  	return ops;
>>  }
>>  
>> +static int iommu_fwspec_assign_iommu(struct iommu_fwspec *fwspec,
>> +				     struct device *dev,
>> +				     struct fwnode_handle *iommu_fwnode)
>> +{
>> +	const struct iommu_ops *ops;
>> +
>> +	if (fwspec->iommu_fwnode) {
>> +		/*
>> +		 * fwspec->iommu_fwnode is the first iommu's fwnode. In the rare
>> +		 * case of multiple iommus for one device they must point to the
>> +		 * same driver, checked via same ops.
>> +		 */
>> +		ops = iommu_ops_from_fwnode(iommu_fwnode);
> 
> This carries over a related bug from the original code: If a device has
> two IOMMUs and the first one probes but the second one defers, ops will
> be NULL here and the check will fail with EINVAL.
> 
> Adding a check for that case here fixes it:
> 
> 		if (!ops)
> 			return driver_deferred_probe_check_state(dev);
> 
> With that, for the whole series:
> 
> Tested-by: Hector Martin <marcan@marcan.st>
> 
> I can't specifically test for the probe races the series intends to fix
> though, since that bug we only hit extremely rarely. I'm just testing
> that nothing breaks.

Actually no, this fix is not sufficient. If the first IOMMU is ready
then the xlate path allocates dev->iommu, which then
__iommu_probe_device takes as a sign that all IOMMUs are ready and does
the device init. Then when the xlate comes along again after suceeding
with the second IOMMU, __iommu_probe_device sees the device is already
in a group and never initializes the second IOMMU, leaving the device
with only one IOMMU.

This patch fixes it, but honestly, at this point I have no idea how to
"properly" fix this. There is *way* too much subtlety in this whole
codepath.

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2477dec29740..2e4baf0572e7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2935,6 +2935,12 @@ int iommu_fwspec_of_xlate(struct iommu_fwspec
*fwspec, struct device *dev,
 	int ret;

 	ret = iommu_fwspec_assign_iommu(fwspec, dev, iommu_fwnode);
+	if (ret == -EPROBE_DEFER) {
+		mutex_lock(&iommu_probe_device_lock);
+		if (dev->iommu)
+			dev_iommu_free(dev);
+		mutex_unlock(&iommu_probe_device_lock);
+	}
 	if (ret)
 		return ret;

> 
>> +		if (fwspec->ops != ops)
>> +			return -EINVAL;
>> +		return 0;
>> +	}
>> +
>> +	if (!fwspec->ops) {
>> +		ops = iommu_ops_from_fwnode(iommu_fwnode);
>> +		if (!ops)
>> +			return driver_deferred_probe_check_state(dev);
>> +		fwspec->ops = ops;
>> +	}
>> +
>> +	of_node_get(to_of_node(iommu_fwnode));
>> +	fwspec->iommu_fwnode = iommu_fwnode;
>> +	return 0;
>> +}
>> +
>> +struct iommu_fwspec *iommu_fwspec_alloc(void)
>> +{
>> +	struct iommu_fwspec *fwspec;
>> +
>> +	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
>> +	if (!fwspec)
>> +		return ERR_PTR(-ENOMEM);
>> +	return fwspec;
>> +}
>> +
>> +void iommu_fwspec_dealloc(struct iommu_fwspec *fwspec)
>> +{
>> +	if (!fwspec)
>> +		return;
>> +
>> +	if (fwspec->iommu_fwnode)
>> +		fwnode_handle_put(fwspec->iommu_fwnode);
>> +	kfree(fwspec);
>> +}
>> +
>>  int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>>  		      const struct iommu_ops *ops)
>>  {
>>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> +	int ret;
>>  
>>  	if (fwspec)
>>  		return ops == fwspec->ops ? 0 : -EINVAL;
>> @@ -2931,29 +2980,22 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>>  	if (!dev_iommu_get(dev))
>>  		return -ENOMEM;
>>  
>> -	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
>> -	if (!fwspec)
>> -		return -ENOMEM;
>> +	fwspec = iommu_fwspec_alloc();
>> +	if (IS_ERR(fwspec))
>> +		return PTR_ERR(fwspec);
>>  
>> -	of_node_get(to_of_node(iommu_fwnode));
>> -	fwspec->iommu_fwnode = iommu_fwnode;
>>  	fwspec->ops = ops;
>> +	ret = iommu_fwspec_assign_iommu(fwspec, dev, iommu_fwnode);
>> +	if (ret) {
>> +		iommu_fwspec_dealloc(fwspec);
>> +		return ret;
>> +	}
>> +
>>  	dev_iommu_fwspec_set(dev, fwspec);
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(iommu_fwspec_init);
>>  
>> -void iommu_fwspec_free(struct device *dev)
>> -{
>> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> -
>> -	if (fwspec) {
>> -		fwnode_handle_put(fwspec->iommu_fwnode);
>> -		kfree(fwspec);
>> -		dev_iommu_fwspec_set(dev, NULL);
>> -	}
>> -}
>> -EXPORT_SYMBOL_GPL(iommu_fwspec_free);
>>  
>>  int iommu_fwspec_add_ids(struct device *dev, u32 *ids, int num_ids)
>>  {
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index e98a4ca8f536b7..c7c68cb59aa4dc 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -813,9 +813,18 @@ struct iommu_sva {
>>  	struct iommu_domain		*domain;
>>  };
>>  
>> +struct iommu_fwspec *iommu_fwspec_alloc(void);
>> +void iommu_fwspec_dealloc(struct iommu_fwspec *fwspec);
>> +
>>  int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>>  		      const struct iommu_ops *ops);
>> -void iommu_fwspec_free(struct device *dev);
>> +static inline void iommu_fwspec_free(struct device *dev)
>> +{
>> +	if (!dev->iommu)
>> +		return;
>> +	iommu_fwspec_dealloc(dev->iommu->fwspec);
>> +	dev->iommu->fwspec = NULL;
>> +}
>>  int iommu_fwspec_add_ids(struct device *dev, u32 *ids, int num_ids);
>>  const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
>>  
> 
> - Hector
> 
> 

- Hector

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
