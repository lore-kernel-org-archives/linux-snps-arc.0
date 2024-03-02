Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0711C54798
	for <linux-snps-arc@archiver.kernel.org>; Sat,  2 Mar 2024 04:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAPBuiLPxEx89FpoiRlebVWAWUcw3fUrnNTqDq7eCSU=; b=scbh4QiSdb2++o
	Bjajts1oRIsHF+bRrpFTQUSryH14FJW+kS6H+NqzHEVJhw6zKDYNEK/FuWDDMIub+RXuAM/dFdgP7
	yyKy0KNYC5KB8VQ4rC9Vy5Pu+s2h8Mf10fWszT/oSM76N2t4vWSz7snyKH6PSv1mRcxfHj7CEHdlW
	J6O4VGtsRqg0dICoU/dEq6pcdJKhhHHKgZQ+n5wXGynOAN0iBtDG7jzX6x4k3O4KQQGLZTX4WaR88
	7SZrCYkp2F1+bVLZdiY2Y2ta4M3vXfvUt8rWXoP4aSpkbJ5WUYFI3dZC46VnLWjfIEO/aiJdWtppq
	Nvq46mjEFZyH4ac4SdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgHCL-00000002mRi-3VR4;
	Sat, 02 Mar 2024 04:42:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgHCI-00000002mQ5-3fHJ
	for linux-snps-arc@lists.infradead.org;
	Sat, 02 Mar 2024 04:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6ED760A06;
	Sat,  2 Mar 2024 04:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C11C433F1;
	Sat,  2 Mar 2024 04:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709354524;
	bh=MXkZbHcAYrMQokVasZjqqARe/8ZeQSSJWSrnamcbMeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pNZVTDW052untAoMM3fIhVi1TOCMARX2epBZqScT5fbxuxftHho8z9ni2Lj573IYY
	 y9jtFKgeNkX7cv8N716ImNE4JMDY0fAMa8s+cuC99ingylOInZl94TBbrXBN10q16/
	 KGr33enxHu9Ak3wLKsvjgPykmD0jIkRNwtq2apjndnTLf5LUg3FKxw47ir6t1pO8QY
	 giKlulyVyiaEt/tL7T37d6hGxplSngTJzcuTuWyslnXtBpwiZyPhk0lFGsMC2+4pLr
	 fTJfdJU02wV3fQF0SFfW5NS9zijWlFQU9t6EZSXmxZMHWx6zaDrM/wNMfh5VwcF3Jt
	 Z2KE9OzM9wHbA==
Message-ID: <5132da26-7c2a-4269-aa71-17315593dbde@kernel.org>
Date: Fri, 1 Mar 2024 20:42:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2.1 01/12] ARC: Use initializer for struct
 vm_unmapped_area_info
Content-Language: en-US
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, bp@alien8.de,
 broonie@kernel.org, dave.hansen@linux.intel.com, debug@rivosinc.com,
 hpa@zytor.com, keescook@chromium.org, kirill.shutemov@linux.intel.com,
 luto@kernel.org, mingo@redhat.com, peterz@infradead.org,
 sparclinux@vger.kernel.org, tglx@linutronix.de, x86@kernel.org,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
References: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <20240302001714.674091-1-rick.p.edgecombe@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20240302001714.674091-1-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_204207_001154_A98855AD 
X-CRM114-Status: GOOD (  16.88  )
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



On 3/1/24 16:17, Rick Edgecombe wrote:
> Future changes will need to add a new member to struct
> vm_unmapped_area_info. This would cause trouble for any call site that
> doesn't initialize the struct. Currently every caller sets each field
> manually, so if new fields are added they will be unitialized and the core
> code parsing the struct will see garbage in the new field.
>
> It could be possible to initialize the new field manually to 0 at each
> call site. This and a couple other options were discussed, and the
> consensus (see links) was that in general the best way to accomplish this
> would be via static initialization with designated field initiators.
> Having some struct vm_unmapped_area_info instances not zero initialized
> will put those sites at risk of feeding garbage into vm_unmapped_area() if
> the convention is to zero initialize the struct and any new field addition
> misses a call site that initializes each field manually.
>
> It could be possible to leave the code mostly untouched, and just change
> the line:
> struct vm_unmapped_area_info info
> to:
> struct vm_unmapped_area_info info = {};
>
> However, that would leave cleanup for the fields that are manually set
> to zero, as it would no longer be required.
>
> So to be reduce the chance of bugs via uninitialized fields, instead
> simply continue the process to initialize the struct this way tree wide.
> This will zero any unspecified members. Move the field initializers to the
> struct declaration when they are known at that time. Leave the fields out
> that were manually initialized to zero, as this would be redundant for
> designated initializers.
>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Link: https://lore.kernel.org/lkml/202402280912.33AEE7A9CF@keescook/#t
> Link: https://lore.kernel.org/lkml/j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs/

LGTM.

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
