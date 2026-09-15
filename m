Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AAC88E7D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9Rc83JhP5S7yFlDiluDjgQIWQgi5WAtIhf+vpVf0Wg=; b=hvEX6Zhj72aOxa
	ivG9JEl8tEwc/LfwM4tlT/55n9G2gedDLhqlazZonlzVdPzdD2TlW7ByAgGrJY9N747Jwo9ENZMpF
	GYbiW/NBViSqS5EgKk07twsc7T4d2uPzWGhiwLRwxgipW5ua9Z2tlWy7XyzLQaANZgm9vtO8facVV
	HewnTf3dVVL/pp3T31zh94iOwMNRMSWcPQ3li5k4+vjCH3+XzYV+CQJL9VnQufEb5iifX+srIyMLI
	oi5C3ymgmuNBbGL1X3epFr8zYtzlqU2eseVcCKnRZ6rgyUF5v+opQCwRU2PKizWZTvgRk/mLBBLFj
	jOvfxdq+X9dPf0ssTXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XKH-00000007eiN-3vd5;
	Tue, 15 Sep 2026 17:52:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XKH-00000007ehj-0mai
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 15 Sep 2026 17:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=; b=II1ZAWppOE+auBYxlIuMLW1rFC
	aoCpsM+BcHGgtXaVEqtJwsUEljXAwRAJYn0tAaSOtwYpAG7mHy62V3CPEughDeZgHtwx2CgHsgFr/
	qCC5f6WKgWqyXG1+Xk7sLVYa+vWrZPaO5gae2vLt3MyES30qqUa2c6KTyv8Y3QCngjET+mTEXEjlY
	2nFS0LYR1NyTA2yg4ZsPMu6NBH9tvt0Rn8S8qdhhAISaF1qR0L3Cp1A7W8QiN4+DNIbkQwyJHobUW
	uQFpwXr4xLtUK/vxufWgRUNxIYbD0dr8FiIzhgxehJe3aazG4TQL7LPbb24+XZwP63gHy+6upSC9V
	OIMIqgbw==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XKD-000000076jl-0WEF
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Sep 2026 17:52:11 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db425c9050so12095ad.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 10:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=pb6AH0xno72ie+LwEpyGNiatyh5e+SKBruX78ArsUCJlQolwcue4cmyQUtuYz9RgxO
         NWKRq4ofkCdGAjULXkLvfMH+7eJ4nwlsHNiLExOCMzSJj91pU+f6UNnUoZIQyYFwaNWT
         74x/63yBwba49/GEfYdW0ZCx5UjmwC0G9xqAIvxt5fJXXb3+tO9yK46mp34mxxB12l2l
         dcFLIuNiyyS236FgrBnSudoGtoFowlRn0FwLBEEnF5JuZNCwPvnl4pESl0/aDm72dE7c
         T52WMEWLHIDl/K6L4CMkAp2ZPbmpUGS9eNnKn3b/IK8IgNhXVr45UKgiev1J2405rIoc
         b9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=ZeWFQgZ4gCXrHCXg0eyZJXgr/5NwoBbZySKaq6xW9Bw=;
        b=eQU4NWPsquMTGQaNW/uNLJb/xIEDYinA9nIxC2rgNmgpFX3sEZmf9B7+tEScElJYDx
         dGsZcImcYD+rtNWLMQ5lDrIKKzaYC+azX6JsfD8NIN8Pa/BvHiCffumS3pdvugE6yT3k
         GrnWk3i7W+1eDSSRl1oOk3cGEmoKHEgYFd3AqaFclS61fjBcUBubF606fnm3XJRpih3o
         2ySMSr7wthjnbXOOyQyyNav+GnqJeCzcyelL1Nqksd0g7kvPjP542gvxKQ1sFUm4amUX
         4XEe5EiHFt626pZ7U32P/u1ShMq3fZHOWR7K7wbuRPV4MS7THfZF0xb0dRcVjWHl4eez
         87Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=v+jO3VJgsnUifpclVFgNdjMcyvUQpnfqHupbIlBGRjnhWtWE97SE9rvGpSIP4pxkSe
         x+TvQSB6BHu7aEaHVF9i+Tkjn617UD9utZMuaCUc0LThFbRvTGBMXVgV2g0cwI0Knhbo
         hW3mOw6slYadATKIlham/UojDKkSqdscHxokQinPCKNPvQf6Bk92Oi1tMmd41AMbVFZM
         xuiw9lXEdvF382NtEcq3V0oehVbN+DF7OVLQeEIAL+ezLrt1HfUv+BOtS2uEKRtM0bXX
         f7OiH78VHG9JEHFH3s+FQmSvt5YdwToBiThIfGmvfkVqDbnj8R5JV7vxFzC2V52td+se
         gxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=eGlXeolux1glUoEwrb6INzh9o73YbfNtEr3XDYVWsjj0LwnwTyRS5pxMZjQgWWKAjx
         rse2je1R2db5/ff5jB7O+cKRp9eEQWFQcduaNtM0/uDJArC/jJz6Cq7Wjzym6gNZ/0Me
         Yi9E01OKTcHRB6lL5DoBVggnctAxX65XufvnvKykPRzr37P2Lw62P9pxrSylCN8a2q7E
         RN4L1O0QlHacPQE50YtyivpLhN3Q54A1XalNXFNpHiTbZZIqFgC/6Q1SFIFgajSCff63
         uVL/fR3fOXgQWPGpHka1s8Eu7bV6VgKi9YzHh0MYCjae2Lj3Ddk3R/XriwH63zmWo6kv
         Btsw==
X-Forwarded-Encrypted: i=1; AKwUvBwIoV4/V8uaJYeVPgbYeQw4vgsb5CXCH3a3iaOT0QROhCFxMvnzFQjg1Yd5Aucb5kE3VDJT2cISPRApWPUUoA==@lists.infradead.org
X-Gm-Message-State: AFuF++mvJDL9eWthq6ouC/RAJuANe+4h4eaeUonFN8I/4r+e5F7uMh4o
	7EWWa83RLQHBXOwC1fL6M8TvFDVDEqjduTHwx5ywPqoh67OV+rLEsZtqerCeiAXkodRuTD5TuPU
	2zFld5IDmswk4e/Cj5HsmzXSOSwEtwLsKwxWIf/Gf
X-Gm-Gg: AYBFou1ddnqfH1UEId3ebex0WGGdnThP/l0U0h+0VgGnOnq1zInVHCsKMtwP3XcAxne
	5eDA7u1Ph2vVWwwXc+QUiSfdaub+gA9BjR1glyDrqKbsL3N/S+w8U2bfA2iUkn1rsbVjKylM55j
	fyewCIsmPFeM0+31EvHg58HrxMY5lYk4LL4PyraHkw0ZSgjxkkByMyXKN5J5miiWln18pTMxWKH
	0dNMf87FV4s2xg5l9PLZr5935Z3u8yM2A8tQVwGEmrOJGeQ5uKPHX1ApOLzg56D4/S0L1VBAfPL
	8zJ1Y4m+NhKBYxiSaKOabZqrIJVQX5tgCGyUTn92bgXbr0SnXj1ai6Hhld/quHvkHIBhILVjXMN
	hVuXG8LS8mBVnkvmv5XWr3G2ZH7c7yha6moxfa7Ql7sw7i3olYXU=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_185209_291496_8B2BCBAE 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTozMeKAr1BNIENocmlzdGlhbiBCcmF1bmVyIDxicmF1
bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFRMO0RSLCB0aGlzIGxldHMgYXJjaCBjb2RlIGhhbmRs
ZSBmZCBpbnN0YWxsIGFuZCBjbGVhbnVwLiBmZF9wcmVwYXJlKCkKPiBhbGxvY2F0ZXMgYSBkZXNj
cmlwdG9yIGxpa2UgZ2V0X3VudXNlZF9mZF9mbGFncygpIGRvZXMgYW5kIHJlY29yZHMgaXQgaW4K
PiBhIHNsb3Qgb24gdGhlIHRhc2suIGZkX3N0YWdlKCkgYXR0YWNoZXMgdGhlIGZpbGUgdG8gdGhh
dCBzbG90IGFuZAo+IHJldHVybnMgdGhlIG51bWJlci4KCkknbSBub3QgcmVhbGx5IGEgZmFuIGJ1
dCBJIGZlZWwgbGlrZSBpZiB5b3Ugd2FudCB0byBkbyB0aGlzLCB5b3UKc2hvdWxkIGJlIHVzaW5n
IHRhc2tfd29yayBzbyB5b3UgZG9uJ3QgaGF2ZSB0byB0b3VjaCB0aGUgZW50cnkvZXhpdApwYXRo
cyBkaXJlY3RseT8gKEFuZCBpZiB0YXNrX3dvcmsgaXMgdG9vIGluZWZmaWNpZW50IHNvbWVob3cs
IHlvdQpjb3VsZCB0aW5rZXIgd2l0aCB0aGUgdGFza193b3JrIGltcGxlbWVudGF0aW9uLikKCj4g
V2hlbiB0aGUgc3lzY2FsbCByZXR1cm5zIHN1Y2Nlc3MgdGhlIGV4aXQgcGF0aCBpbnN0YWxscyBl
dmVyeSBzdGFnZWQKPiBmaWxlLiBXaGVuIGl0IHJldHVybnMgYW4gZXJyb3IgaXQgZHJvcHMgdGhl
IGRlc2NyaXB0b3JzIGFuZCB0aGUgZmlsZXMuCgpJcyB0aGlzIG1haW5seSBhYm91dCBzdHVmZiBs
aWtlICJ3ZSBpbnN0YWxsZWQgYSBmaWxlIGRlc2NyaXB0b3IgYW5kCnRoZW4gdGhlIGZvbGxvd2lu
ZyBwdXRfdXNlcigpIGZhaWxlZCI/IEJlY2F1c2UgaWYgc28sIEkgdGhpbmsgYSBuaWNlcgpmaXgg
d291bGQgYmUgdG8gaGF2ZSBhIHBvbGljeSBvZiAiaWYgdXNlcnNwYWNlIHByb3ZpZGVzIHVud3Jp
dGFibGUKbWVtb3J5IHRvIGEgc3lzY2FsbCwganVzdCBrZWVwIGdvaW5nIGFuZCBwcmV0ZW5kIHRo
ZSBhY2Nlc3Mgd29ya2VkIiwKYW5kIG1heWJlIGhhdmUgYSBzeXNjdGwgdGhhdCBraWxscyB0aGUg
cHJvY2VzcyB3aGVuIHRoaXMgaGFwcGVucyB0bwplbXBoYXNpemUgdGhhdCB1c2Vyc3BhY2Ugc2hv
dWxkIG5vdCBiZSBkb2luZyB0aGlzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
