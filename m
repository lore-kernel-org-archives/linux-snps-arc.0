Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358EDC432BE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E708C60F56
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E708C60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsFfB4fLSsMDednpmPN372XXmwpg7EPoLxdlmn+by/E=; b=tSXzefoqdUWNV2
	ww9vjqUZ5JEc6Fu4d54AQzpymvGLxtAcfch/jAeX0Ib+kQfTVCSMefEuI1jDcE7x2a56+Z0EqSMVJ
	uV11Hfq4AD6h95YTrW1ZAetuDshbzfivnMX5CIG1kgPatJ51vG4IV49oJZ+Cpo2C8mskqoJHZhcnF
	MqnKDXeiV0u3D+42dxoP8NfDvyd7iXT+veA5P7MepcNTGcg7C066ZE0yce0C2dOcnqv2YDjg3PXp2
	7wrVBmAoOKdmUVjqM9OKOYkg08iqAXwH7cN5QWHiyTcp2d2MpuznJmHtggKkazSaqAUzw5DjLk+Ts
	zBBk6PlmfJc74F/5c2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDn8o-006xCH-6z; Wed, 11 Aug 2021 12:15:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDn8k-006xAf-J1
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 12:15:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA16760FC3;
 Wed, 11 Aug 2021 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628684122;
 bh=irWqmSUH1/ML7unA3kAGPLQs6RzjTFj1LRE3RBi/7uA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HWiEn6NQt2QEye6Wzv9LpGZn4RqnIljkxxoNbuBDIu4bd3YZe+W1DYmeqtLQFUtSq
 0e8yYus7TgjRw6ZrpCzOzjwimI2Us1Ot1dII3/iOUjl8lQn9UoJ3t5twgQtV/Ez3Xw
 +zgbPEaJhx37Ojq8iEglLqVqemr7Ve+B8vmalbMuZOJ5I3enz1cRyBYnFSld8DU0YJ
 BIx9lJ4Fii9axtjz7BTFuNRLDo40kAMm2TLo9aY7SsZYqo98nCYo9IwVKjyrSqlrgo
 7a9xr13+/PbEGH9ZB5ajQ5eG9oPKCu/ejw/vQ/uH6nEVj8gu2JkpHKjd5T3UYbtc5G
 ga165PmyZH8cg==
Date: Wed, 11 Aug 2021 15:15:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 11/18] ARC: mm: move MMU specific bits out of entry code
Message-ID: <YRO/VSMNi00X37xQ@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-12-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-12-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_051522_668009_7C247B6E 
X-CRM114-Status: GOOD (  14.08  )
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

I believe a few words here would be useful even for the future version of
yourself ;-)

On Tue, Aug 10, 2021 at 05:42:51PM -0700, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/kernel/entry.S | 6 ------
>  arch/arc/mm/tlb.c       | 3 +++
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
> index 2cb8dfe866b6..684efd094520 100644
> --- a/arch/arc/kernel/entry.S
> +++ b/arch/arc/kernel/entry.S
> @@ -101,12 +101,6 @@ ENTRY(EV_MachineCheck)
>  	lr  r0, [efa]
>  	mov r1, sp
>  
> -	; hardware auto-disables MMU, re-enable it to allow kernel vaddr
> -	; access for say stack unwinding of modules for crash dumps
> -	lr	r3, [ARC_REG_PID]
> -	or	r3, r3, MMU_ENABLE
> -	sr	r3, [ARC_REG_PID]
> -
>  	lsr  	r3, r2, 8
>  	bmsk 	r3, r3, 7
>  	brne    r3, ECR_C_MCHK_DUP_TLB, 1f
> diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
> index b68d5798327b..34f16e0b41e6 100644
> --- a/arch/arc/mm/tlb.c
> +++ b/arch/arc/mm/tlb.c
> @@ -813,5 +813,8 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
>  		}
>  	}
>  
> +	/* Re-enable MMU as hardware may have auto-disabled it upon exception */
> +	write_aux_reg(ARC_REG_PID, read_aux_reg(ARC_REG_PID) | MMU_ENABLE);
> +
>  	local_irq_restore(flags);
>  }
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
