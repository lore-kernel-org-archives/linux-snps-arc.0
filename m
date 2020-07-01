Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A310C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:46:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF31220760
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bADt2rCD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHFFI03E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF31220760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7T/6axeLze6qqJsAlJQOBOjVVcxcC+Th+omsImTxk9I=; b=bADt2rCDUFeYOldhPGXBn3NN7
	tY6W7kyUKdoj2Wy1xHk2kZ07G4Uvjgymqy1V4U44WQVtBiF12VuGkEaVw84qFuXhT/xjJQhPngkVn
	LRqjS+ggAqU1dLKktwMd0LkAwCRL4dvWrLnfx/Z/Zqfzmv5qrU590rADcrJnVeu4j6bKflLnsISJW
	xTivh8wetC9GveW91iYtkOEGQ3rc+OGwNhS75pEyWp1bQpdfrh3QD7u9yb6FW6PAIRYjdArf2vJ0b
	wugF3s0FEsx2jlUwBXYRFvoejgSahSl0YQt0PMuKTPnNFjZZQD1OdktvXj8PpRhOBRJS0Jq/GB8ha
	9MzB25X7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqigE-0000HE-AH; Wed, 01 Jul 2020 19:46:02 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqigC-0000Gd-5h
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 19:46:01 +0000
Received: by mail-qt1-x844.google.com with SMTP id d27so19425575qtg.4
 for <linux-snps-arc@lists.infradead.org>; Wed, 01 Jul 2020 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c4zpncRf/53Fw9b9WE/YB69yuU0m4G/4KFqvY9EzQz4=;
 b=ZHFFI03EkAJoTrFrhjztPadokihcFc5EaTlQ32yH4snA9Rhf+o9vR+ddypcPqnl133
 uqkT7s68ADcLF+y1n5YSvzbhlCdMd0JtEqdNQm0cF/h91ZfrC5xxF8K7o5bK8y5cjinS
 7tOolnYOvZUNbMWXVatbVKq4g4ZsJTdc3+w1IkuDDEwN63gFPoph9Wafgm9Gu3FOpJyv
 8GYv+VeEcbcTsQln+F/WSSSzrqWEdH0fhkXhccUtbM3yhccfhhsC+3Iq+bMUWWq9zgrY
 zrt4IXtXCkiJx1K3CD7zCkyV6ypAnmn8l+dlkwlEyoULKIeacXiX8KyWGXCJ3Dk+Ezlt
 +t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c4zpncRf/53Fw9b9WE/YB69yuU0m4G/4KFqvY9EzQz4=;
 b=WkxCHScn6Uu0Ofhx5zlt15h7TA9pk34eZzRSLrQ+gRYtH42g9xIZduId3Q7WpeSqNo
 ebswUjuq3Mfz0aO9yuLVVieAfueWn1+vr9m9sC/OWqLgRoU6YDfZuUeCq5PQVUfzjsx2
 sV8ln4PvbNcchpCJ1NMMtAID0k/4FYyGDs8rQIDrXX247qHj9hN3kACtwdt+HfcF3xoO
 pd2I+mvYC1/wFWeGuCDf9Z6sjJUEo0wa9KHetsvCKIBuQd0ie2GftFNp88qSloQ23I/r
 QnYdvfmpET0FzxzOw4e2prVPrnNqtafNAIpqpjlPWTg48YDW6qebmKPmKwzXLStqWui8
 Hziw==
X-Gm-Message-State: AOAM5318DjIZXb0SKsilIeaAds6EsHzbhg8oWawZ8Y7rYM5fPCYpGwgN
 hgz/gvk2QZPVNPooYh6Bg3rvzf+CFZg=
X-Google-Smtp-Source: ABdhPJxNWtKA+bnt9TEuEfdPWlOEHLq7bf+HDcuo9fedZUFGwWW8/xALI71e/NSpWSOVwzhoOp2dNw==
X-Received: by 2002:ac8:7a69:: with SMTP id w9mr28217718qtt.179.1593632757894; 
 Wed, 01 Jul 2020 12:45:57 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id x14sm6242635qki.65.2020.07.01.12.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 12:45:57 -0700 (PDT)
Subject: Re: [PATCH v7.1 01/13] ARC: ABI Implementation
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200615201441.31820-2-vgupta@synopsys.com>
 <20200701000643.14065-1-vgupta@synopsys.com>
 <b6322150-240a-5f06-b700-83e3eb79deec@linaro.org>
 <96a79297-9161-89a2-25d6-473979525367@synopsys.com>
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
Message-ID: <7b8f6b61-c75c-b0b5-d2fc-89a6fa007569@linaro.org>
Date: Wed, 1 Jul 2020 16:45:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <96a79297-9161-89a2-25d6-473979525367@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_154600_542664_E1C03E86 
X-CRM114-Status: GOOD (  18.48  )
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



On 01/07/2020 16:36, Vineet Gupta wrote:
> On 7/1/20 9:50 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 30/06/2020 21:06, Vineet Gupta via Libc-alpha wrote:
>>> This code deals with the ARC ABI.
>>> ---
>>>    Changes since v7:
>>>      - Used void * (iso int *) in tls-macros.h
>>
>> LGTM, with just a couple of syntax nits below.
>>
>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> 
> Thx. I suppose the process for new ports is to have a Reviewed-by on all patches,
> squash them and push in 1 go (although in past I was asked to push the ARC elf
> header patch).

I think there is no need to squash them up in one commit, but I think
it would be better to commit them at the same time.

> Also do we need more than 1 Reviewed-by for this to be "push worthy" ?

I don't think so, unless someone raise some questioning on the review
itself.

I plan to finish them up by the end of the week.

> 
>>> +ENTRY (__longjmp)
>>> +
>>> +	LDR (blink, r0,  0)
>>> +	LDR (sp,    r0,  1)
>>> +	LDR (fp,    r0,  2)
>>> +	LDR (gp,    r0,  3)
>>> +
>>> +	LDR (r13,   r0,  4)
>>> +	LDR (r14,   r0,  5)
>>> +	LDR (r15,   r0,  6)
>>> +	LDR (r16,   r0,  7)
>>> +	LDR (r17,   r0,  8)
>>> +	LDR (r18,   r0,  9)
>>> +	LDR (r19,   r0, 10)
>>> +	LDR (r20,   r0, 11)
>>> +	LDR (r21,   r0, 12)
>>> +	LDR (r22,   r0, 13)
>>> +	LDR (r23,   r0, 14)
>>> +	LDR (r24,   r0, 15)
>>> +
>>> +	mov.f  r0, r1
>>> +	j.d    [blink]
>>> +	mov.z  r0, 1	/* don't return 0 to setjmp callsite from longjmp.  */
>>> +
>>> +END (__longjmp)
>>
>> Ok, you have removed r25 save as pre previous discussion.
> 
> Right, and GP is being saved now.
> 
>>> diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
>>> new file mode 100644
>>> index 000000000000..6bba95fafe0f
>>> --- /dev/null
>>> +++ b/sysdeps/arc/bits/setjmp.h
>>> @@ -0,0 +1,26 @@
>>> +/* Define the machine-dependent type `jmp_buf'.  ARC version.
>>
>> I think current trend is to just use apostrophe instead of the grave
>> accent in such cases.
> 
> Ok changed.
> 
>>> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
>>> +{
>>> +  unsigned long int idx = pltn - plt0;
>>> +
>>> +  /* PLT trampoline is 16 bytes. */
>>
>> Double space after period.
> 
> Fixed.
> 
>>> +#define _JMPBUF_UNWINDS_ADJ(_jmpbuf, _address, _adj) \
>>> +  ((uintptr_t) (_address) - (_adj) < (uintptr_t) (_jmpbuf_sp (_jmpbuf) - (_adj)))
>>> +
>>> +/* We use the normal longjmp for unwinding.  */
>>> +#define __libc_unwind_longjmp(buf, val) __libc_longjmp (buf, val)
>>
>> Ok. As a side note teh jmpbuf-unwind.h is candidate for some consolidation
>> (the same macros are replicated in each architecture).
> 
> OK.
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
