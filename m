Return-Path: <SRS0=fnYR=NJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C34C4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Aug 2021 01:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF58061051
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Aug 2021 01:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF58061051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZQ9l2AYj5Z5/5HXNpmLz6T/dziSf3V5mE5F5KyvxaY=; b=Kf8UhS3L9QS/+BJlsLZAH65wGY
	T6fE5g3n9bNLBuauInMwkGDGgcUneJvJ6825ks5nm9QSs3GUIolCj8zA2W2S26QNyUgI2ZssEpggF
	z35VLUtKmZQ1Bm0I8S9hMGskWTfxp9aHXPA6V248nylCKBVeStW2EimpF/JKnB5dsyz+hb9aL3VMN
	q0wZC72Y0lgSptWgJEuIqz7E0E20fXbI6e8/CVALIC8sbnbrmUt/3b4givCOtJBuoSKSTF6jVaIsP
	QAAzgVRbBfwE+fAawSKHDCNk+Ww1tsu4OwGlhcNdSAqI6ATWXzAebCiRws+pnDpyMOLfFcwpl2CMu
	lA3GfSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAYw-003uBA-AN; Wed, 18 Aug 2021 01:40:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAYu-003uAh-1i
 for linux-snps-arc@lists.infradead.org; Wed, 18 Aug 2021 01:40:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 983DE61056;
 Wed, 18 Aug 2021 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629250811;
 bh=YI8mfiwFPl0WAi650tapm83R/R8vugpTBzE0LO23fKI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jBbiCeQh4wFIXSkOKlQlPBrRoLdxTbznvoEn/ty317oq7vMLhsls1cMCttoa2WUNf
 zo1OAiWgW4+h5g+7KAcMbZrJIDZaukxX+u4LNLKJg5B3H1kdviw0JzoU5Mg0hoslDH
 WX0srr5/8nyQ2HVeCt7D7EGb93tUciNhLIiTCTd/4p34MZnUGSRI9yqoQIiu4gCFYX
 LkIPSAQdf4PTZvT2EDzAARQCeeGJwHtYg1zxHbJbPub3gWGlnJnCztwLSZfbK60NXI
 Y6jPMxKRkYn8Fm4vtdusPAWUS2QFnGnhdb3wy2fLsEj81q8jPK/uHeg+P/Cza1pkgI
 alCRrB3yNJr0g==
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
 <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
 <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
Date: Tue, 17 Aug 2021 18:40:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_184012_170505_23550C8C 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 8/17/2021 11:07 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
>>> cc-option-yn can be replaced with cc-option. ie.
>>> Checking for support:
>>> ifeq ($(call cc-option-yn,$(FLAG)),y)
>>> becomes:
>>> ifneq ($(call cc-option,$(FLAG)),)
>>>
>>> Checking for lack of support:
>>> ifeq ($(call cc-option-yn,$(FLAG)),n)
>>> becomes:
>>> ifeq ($(call cc-option,$(FLAG)),)
>>>
>>> This allows us to pursue removing cc-option-yn.
>>>
>>> Cc: Vineet Gupta <vgupta@kernel.org>
>>> Cc: linux-snps-arc@lists.infradead.org
>>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>> ---
>>>    arch/arc/Makefile | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
>>> index c0d87ac2e221..8782a03f24a8 100644
>>> --- a/arch/arc/Makefile
>>> +++ b/arch/arc/Makefile
>>> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
>>>    cflags-y                            += $(tune-mcpu-def-y)
>>>    else
>>>    tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
>>> -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
>>> -ifeq ($(tune-mcpu-ok),y)
>>> +ifneq ($(call cc-option,$(tune-mcpu)),)
>>>    cflags-y                            += $(tune-mcpu)
>>
>> Any reason not to just turn this into
>>
>> cflags-y += $(call cc-option,$(tune-mcpu))
>>
>> ?
> 
> Yes, you'll need to pull up the source; the diff doesn't provide
> enough context. tune-mcpu is used in the body of the else branch
> hinted at by the diff. PTAL

Ah, fair enough. The warning is a little unconventional but oh well :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>>
>> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
>>
>>>    else
>>>    # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
>>>
> 
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
