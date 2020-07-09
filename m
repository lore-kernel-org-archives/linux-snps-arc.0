Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA420C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA989207DD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cMmjM7wS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7MWiKWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA989207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O9sz8EhO+uASHSo3xTrjeXk+Gov6PRYg77w5pLVttZE=; b=cMmjM7wStqSq9Al6ucb9BFjh8
	6dr5Pdp86uP8MN23AjX0DWd1pp0V+xWB43Yb5sbf9VYXzVE2/BvG4XlKBytkUsjocS9ojfkMCfGMA
	FosXwSR8ORcktf4mAFffhP4Uvh1J05xZo011l2mF5JyLG7o6axllWHcKigG3bkNuX5WnAmMvBpYVi
	+Pw056hC7cnUred4/TbXq3HoH8cLJ2jWR7mgRnVyAlq59bhDIIgvooIiMkBgRK6VYsKjyd8L0MWoW
	K5nG0Fq1CruNycXzvNNA8Orhqk9HHcifdw7pDXBsIYt87TH4yUNKGo0WNGSvyLutPJwS1pE0pY2/z
	Oui3vS86g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtZMz-0004xY-Ut; Thu, 09 Jul 2020 16:25:57 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZMx-0004wK-IC
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 16:25:56 +0000
Received: by mail-qt1-x842.google.com with SMTP id w27so2101213qtb.7
 for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2020 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qBuKsMBgDhWtsCXubcnULjjPER4MRq000asa9aqnuzc=;
 b=Y7MWiKWvxBAQeTgszSC5CkYro9fJ9wTjWLI58rD+FDNAHPllq0d9UkMgX1o8LOuV1Z
 hvwhrVN7MOu6XPrnDOTxFwW4Gz4C55jFMFWbvAgBfIiTvjYAo5Bfmr30ynvJDF/IAD5F
 pQ44VFtbv1sTk4d0NhxUrDTwPdheNrxkyyVmRJNvFgQoMc1Ow4APTL00H6Vif7F8mvVe
 lV8wuXzBtP+EDLyUT4aQG+iByfyhZW3+2eK0/FxdKi2yTKGZ47wbVQTsAz9aEOJoACL/
 L5FJfxEps+XAG1FndcpoB7II+OMxNNs/DmZOGJ52yLL0kPBA6LXZNYdfKDVCY4Dfan0v
 SFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qBuKsMBgDhWtsCXubcnULjjPER4MRq000asa9aqnuzc=;
 b=c8ujtCDx1PtfZQ5d5PPaN/IEux1+alEd16RSYf08TfMrkYeOxvTnhRUTbg7VWkLtC8
 uIbcq/GOVkpw/FEB68tNrYMWDwWFrLzv9P5+S3cxrpXDWIYbgoRaiu9olkEaUVynHG1Z
 dnHC9PuhCpGn5BXJecfoSxni2StLm/uqpzfUSCi1JxNDxPLNO12E74mEyv4oP4ceUwYb
 zHtPjuak2RvUuZWv/oxg+JKxfzvgbIfdPc99m4FA8/WINnp2bcRVERRMpqmA0ZCjVOLr
 m5NYIYkPFIq2AF4eM10IJZ6kUoVFAgN68PMlNbAhQ3rukxT1Or0mS1+27+W5uW36CCAs
 WIVw==
X-Gm-Message-State: AOAM532eIjUk/MeAD27zEXExxwDJ3TzbU28rvthEqMkVlEn2PpLOKpsb
 d4M0yCbX0d3w2WAoXK7GDphPnAV4BDk=
X-Google-Smtp-Source: ABdhPJyNLqa9cLQdMv8XeVGlyurVKsXWIVmU/YdAjj98sHzgEWa/AFdGPkvh4fkLRMB40YxITf61pg==
X-Received: by 2002:ac8:3837:: with SMTP id q52mr31569941qtb.186.1594311953736; 
 Thu, 09 Jul 2020 09:25:53 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id k6sm4143045qki.123.2020.07.09.09.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 09:25:53 -0700 (PDT)
Subject: Re: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 mQINBFcVGkoBEADiQU2x/cBBmAVf5C2d1xgz6zCnlCefbqaflUBw4hB/bEME40QsrVzWZ5Nq
 8kxkEczZzAOKkkvv4pRVLlLn/zDtFXhlcvQRJ3yFMGqzBjofucOrmdYkOGo0uCaoJKPT186L
 NWp53SACXguFJpnw4ODI64ziInzXQs/rUJqrFoVIlrPDmNv/LUv1OVPKz20ETjgfpg8MNwG6
 iMizMefCl+RbtXbIEZ3TE/IaDT/jcOirjv96lBKrc/pAL0h/O71Kwbbp43fimW80GhjiaN2y
 WGByepnkAVP7FyNarhdDpJhoDmUk9yfwNuIuESaCQtfd3vgKKuo6grcKZ8bHy7IXX1XJj2X/
 BgRVhVgMHAnDPFIkXtP+SiarkUaLjGzCz7XkUn4XAGDskBNfbizFqYUQCaL2FdbW3DeZqNIa
 nSzKAZK7Dm9+0VVSRZXP89w71Y7JUV56xL/PlOE+YKKFdEw+gQjQi0e+DZILAtFjJLoCrkEX
 w4LluMhYX/X8XP6/C3xW0yOZhvHYyn72sV4yJ1uyc/qz3OY32CRy+bwPzAMAkhdwcORA3JPb
 kPTlimhQqVgvca8m+MQ/JFZ6D+K7QPyvEv7bQ7M+IzFmTkOCwCJ3xqOD6GjX3aphk8Sr0dq3
 4Awlf5xFDAG8dn8Uuutb7naGBd/fEv6t8dfkNyzj6yvc4jpVxwARAQABtElBZGhlbWVydmFs
 IFphbmVsbGEgTmV0dG8gKExpbmFybyBWUE4gS2V5KSA8YWRoZW1lcnZhbC56YW5lbGxhQGxp
 bmFyby5vcmc+iQI3BBMBCAAhBQJXFRpKAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJ
 EKqx7BSnlIjv0e8P/1YOYoNkvJ+AJcNUaM5a2SA9oAKjSJ/M/EN4Id5Ow41ZJS4lUA0apSXW
 NjQg3VeVc2RiHab2LIB4MxdJhaWTuzfLkYnBeoy4u6njYcaoSwf3g9dSsvsl3mhtuzm6aXFH
 /Qsauav77enJh99tI4T+58rp0EuLhDsQbnBic/ukYNv7sQV8dy9KxA54yLnYUFqH6pfH8Lly
 sTVAMyi5Fg5O5/hVV+Z0Kpr+ZocC1YFJkTsNLAW5EIYSP9ftniqaVsim7MNmodv/zqK0IyDB
 GLLH1kjhvb5+6ySGlWbMTomt/or/uvMgulz0bRS+LUyOmlfXDdT+t38VPKBBVwFMarNuREU2
 69M3a3jdTfScboDd2ck1u7l+QbaGoHZQ8ZNUrzgObltjohiIsazqkgYDQzXIMrD9H19E+8fw
 kCNUlXxjEgH/Kg8DlpoYJXSJCX0fjMWfXywL6ZXc2xyG/hbl5hvsLNmqDpLpc1CfKcA0BkK+
 k8R57fr91mTCppSwwKJYO9T+8J+o4ho/CJnK/jBy1pWKMYJPvvrpdBCWq3MfzVpXYdahRKHI
 ypk8m4QlRlbOXWJ3TDd/SKNfSSrWgwRSg7XCjSlR7PNzNFXTULLB34sZhjrN6Q8NQZsZnMNs
 TX8nlGOVrKolnQPjKCLwCyu8PhllU8OwbSMKskcD1PSkG6h3r0AquQINBFcVGkoBEACgAdbR
 Ck+fsfOVwT8zowMiL3l9a2DP3Eeak23ifdZG+8Avb/SImpv0UMSbRfnw/N81IWwlbjkjbGTu
 oT37iZHLRwYUFmA8fZX0wNDNKQUUTjN6XalJmvhdz9l71H3WnE0wneEM5ahu5V1L1utUWTyh
 VUwzX1lwJeV3vyrNgI1kYOaeuNVvq7npNR6t6XxEpqPsNc6O77I12XELic2+36YibyqlTJIQ
 V1SZEbIy26AbC2zH9WqaKyGyQnr/IPbTJ2Lv0dM3RaXoVf+CeK7gB2B+w1hZummD21c1Laua
 +VIMPCUQ+EM8W9EtX+0iJXxI+wsztLT6vltQcm+5Q7tY+HFUucizJkAOAz98YFucwKefbkTp
 eKvCfCwiM1bGatZEFFKIlvJ2QNMQNiUrqJBlW9nZp/k7pbG3oStOjvawD9ZbP9e0fnlWJIsj
 6c7pX354Yi7kxIk/6gREidHLLqEb/otuwt1aoMPg97iUgDV5mlNef77lWE8vxmlY0FBWIXuZ
 yv0XYxf1WF6dRizwFFbxvUZzIJp3spAao7jLsQj1DbD2s5+S1BW09A0mI/1DjB6EhNN+4bDB
 SJCOv/ReK3tFJXuj/HbyDrOdoMt8aIFbe7YFLEExHpSk+HgN05Lg5TyTro8oW7TSMTk+8a5M
 kzaH4UGXTTBDP/g5cfL3RFPl79ubXwARAQABiQIfBBgBCAAJBQJXFRpKAhsMAAoJEKqx7BSn
 lIjvI/8P/jg0jl4Tbvg3B5kT6PxJOXHYu9OoyaHLcay6Cd+ZrOd1VQQCbOcgLFbf4Yr+rE9l
 mYsY67AUgq2QKmVVbn9pjvGsEaz8UmfDnz5epUhDxC6yRRvY4hreMXZhPZ1pbMa6A0a/WOSt
 AgFj5V6Z4dXGTM/lNManr0HjXxbUYv2WfbNt3/07Db9T+GZkpUotC6iknsTA4rJi6u2ls0W9
 1UIvW4o01vb4nZRCj4rni0g6eWoQCGoVDk/xFfy7ZliR5B+3Z3EWRJcQskip/QAHjbLa3pml
 xAZ484fVxgeESOoaeC9TiBIp0NfH8akWOI0HpBCiBD5xaCTvR7ujUWMvhsX2n881r/hNlR9g
 fcE6q00qHSPAEgGr1bnFv74/1vbKtjeXLCcRKk3Ulw0bY1OoDxWQr86T2fZGJ/HIZuVVBf3+
 gaYJF92GXFynHnea14nFFuFgOni0Mi1zDxYH/8yGGBXvo14KWd8JOW0NJPaCDFJkdS5hu0VY
 7vJwKcyHJGxsCLU+Et0mryX8qZwqibJIzu7kUJQdQDljbRPDFd/xmGUFCQiQAncSilYOcxNU
 EMVCXPAQTteqkvA+gNqSaK1NM9tY0eQ4iJpo+aoX8HAcn4sZzt2pfUB9vQMTBJ2d4+m/qO6+
 cFTAceXmIoFsN8+gFN3i8Is3u12u8xGudcBPvpoy4OoG
Message-ID: <89fb5e8e-2c21-1fcf-e3cb-7d8c5395422b@linaro.org>
Date: Thu, 9 Jul 2020 13:25:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_122555_652427_71378E53 
X-CRM114-Status: GOOD (  12.38  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 09/07/2020 13:24, Vineet Gupta wrote:
> On 7/9/20 9:03 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 08/07/2020 16:32, Vineet Gupta wrote:
>>> On 7/8/20 9:31 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>>
>>>> On 07/07/2020 17:55, Vineet Gupta via Libc-alpha wrote:
>>>>> ---
>>>>>    Changes since v7.1:
>>>>>      - Added a few more 32-bit time_t syscalls to fixup-asm-unistd.h
>>>>>        and regen arch-syscall.h to remove them: __NR_timer{g,s}ettime,
>>>>>        __NR_clock_{gettime,nanosleep,settime}
>>>>>      - minimal/annotated list of 32-bit syscall aliases in ARC sysdeps.h
>>>>>        for 64-bit time_t support
>>>>>      - Open-coded SYS_ify() but retained the macro as used by common
>>>>>        code
>>>>>      - No functional changes in generated dsos.
>>>>>    Changes since v7:
>>>>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
>>>> LGTM, thanks.
>>>>
>>>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>>>
>>> Thx a lot. I now have Reviewed-by tags on all ARC patches so we just need the
>>> sysvipc/semctl y2038 patches to hit upstream before I can commit.
>>
>> The patches are in, if you could just to a sanity check I will
>> be grateful. 
> 
> Thx.
> 
> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> abilist updates). Will do a full testsuite run and if thats same as before, I'm
> good to push ARC port ?
> 

I think it should suffice, just to avoid some issue with recent
traffic on repository recently.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
