Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B63C88E72
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8OzIYVC5624RIiUkBgaMM4gBMeS2YAsLmZ1KpZWr9U=; b=dTgEVzCj/RLNpj
	WQKf53e+dYRVqjyTWvcWxOCDQnpVyhORQYsr/Yuy3QmJ/R/jDQP0ERnRLs1uS6+3uREBRqi15p3E0
	5DPPGr637HdA382HV2aXxOU53ivgfHeh8F+WsxjtAlvlRYLTgoPV3MIdJR+XfLFBTSeOBcs/A/xKj
	9fE6ZqC16Qp/f+0gMDSiRcHFSb38v9P1cUf9MeqQq84gHwcbEc9DYsBKq29hU2da6/PlqsZSz9HZ0
	DCuARpg8t/I01lYeRfm/YEDzMJP29d+AL6e9MmKLaWoG3TGfL5zaIxTXowrpBDej/6AF5GSeIhmH/
	65Ns/1ykjtRvdmA/oLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DNN-0000000BaBe-0MHV;
	Thu, 17 Sep 2026 14:46:13 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DNK-0000000BaBK-3pCC
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 14:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789656352; bh=cR19NOwEHrL0x+Cw1KRK+wG
	oPhZS1Os2ZremNtqq9Ps=; b=AZ5LkLVAJ477b6736G8iO5Gn721CcqBI8xHooARsHdkrqRKMf8
	FTewoEEX0awObIvZkFhNscCm+VITa1hhw5+VOH1fIfhf2sG073ySi9lr9eAXk19qA9y+2NT6ekw
	EZfHx24PBoNamdt+ZKbjpZhKEJAtqawuQOGWmRZbR15ENC9VKhqBEoOEI26ZgM+8ieRVc0BrTdi
	If3O57cdrC+4sPxVo4KNVKh8imm8+2a6aDBwIzkZ9bQuI7/hwCnEFyVc+Z5ZDFsMj3SWTx9JyFO
	1xEOo1emZMiIsEDZC+HbDORu6R+oQKVzwgiZJiIm/LX3Z2jXwUEUYPZhrlyVDwk4bIQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789656352; bh=cR19NOwEHrL0x+Cw1KRK+wG
	oPhZS1Os2ZremNtqq9Ps=; b=IhIGaLkZXFtovgOWXAWmF4RT3aS1zCHCodx3JYfCooGmK8IO4T
	2+62Hid8+FHMNm4wVuw2afTZokcU3yhcVVBw==;
Date: Thu, 17 Sep 2026 15:45:52 +0100
From: Bradley Morgan <brads@mainlining.org>
To: David Laight <david.laight.linux@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] csky: Emulate two-byte cmpxchg
In-Reply-To: <20260917100435.664cf00d@pumpkin>
References: <20260916200215.21774-1-brads@mainlining.org> <20260916200215.21774-4-brads@mainlining.org> <20260917100435.664cf00d@pumpkin>
Message-ID: <F5B68A82-2A9B-43B6-B45C-205E81379163@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074611_099556_9160C49E 
X-CRM114-Status: GOOD (  15.98  )
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

On 17 September 2026 10:04:35 BST, David Laight
<david.laight.linux@gmail.com> wrote:
>On Wed, 16 Sep 2026 20:02:13 +0000
>Bradley Morgan <brads@mainlining.org> wrote:
>
>> CSKY has no two-byte atomic compare and swap, so the __cmpxchg()
>> switches in cmpxchg.h let case 2 fall through to the undefined
>> __cmpxchg_called_with_bad_pointer(), failing at link time. Route case
>> 2 through the new cmpxchg_emu_u16(), which now takes natural u16
>> arguments, so the (uintptr_t) casts on __old and __new become (u16)
>> casts in all three switch instances.
>> 
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>>  arch/csky/include/asm/cmpxchg.h | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/arch/csky/include/asm/cmpxchg.h
>b/arch/csky/include/asm/cmpxchg.h
>> index db6dda47184e..e53628268e8c 100644
>> --- a/arch/csky/include/asm/cmpxchg.h
>> +++ b/arch/csky/include/asm/cmpxchg.h
>> @@ -65,6 +65,9 @@
>>  	case 1:							\
>>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>>  		break;						\
>> +	case 2:							\
>> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
>> +		break;						\
>
>Did you check that compiles?
>It needs to compile without a warning when exchanging a pointer type.
>I think it would be better to make both __old and __new 'unsigned long'
>adding a cast in the definition/assignment to convert pointers.
>aka:
>	unsigned long __old = (unsigned long)(old);
>
>(The cast on the call is separate from the type of the function
>parameters.)
>
>Not a new bug, but there also doesn't seem to be a pointer-integer type
>check here (there is probably one in another architecture).
>
>I think that means these compile:
>	int i;
>	int *p;
>	...
>	cmpxchg(&p, 4, 5);
>	cmpxchg(&i, p, 5);
>
>Simplest fix is probably:
>	unsigned long __old = (unsigned long)(0 ? *__ptr : (old));
>
>David
>

Makes sense. I'll just do a V3 adding tags and your fix, cause csky ? And
the main patch is the one having issues in sashiko.



>
>>  	case 4:							\
>>  		asm volatile (					\
>>  		"1:	ldex.w		%0, (%3) \n"		\
>> @@ -98,6 +101,9 @@
>>  	case 1:							\
>>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>>  		break;						\
>> +	case 2:							\
>> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
>> +		break;						\
>>  	case 4:							\
>>  		asm volatile (					\
>>  		"1:	ldex.w		%0, (%3) \n"		\
>> @@ -132,6 +138,9 @@
>>  	case 1:							\
>>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>>  		break;						\
>> +	case 2:							\
>> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
>> +		break;						\
>>  	case 4:							\
>>  		asm volatile (					\
>>  		RELEASE_FENCE					\
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
