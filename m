Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E355C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 20:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67B62074B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 20:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFhAGNik";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HiKvLeux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67B62074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUfnct/em5MyreQd6QERm7gEJYkz5LvapTR2WNCG/5g=; b=ZFhAGNik76j+r6
	xqCsEBvdABgsFTqLStzj9S4D3/QGwHFMNnca7df3vYCE+O8dlHxTi6nY9GJ/pUZM/4v2v2Oji1/oz
	1TaVV8nJD6qBcqsczCfinvUTzmEiLkx+pdtxGpcxUrvb+cNfDhzXM2YEx5wsjOg7z0EXIyb+wL48D
	Y9S7JUEJo5wnXtZnElKvL1kC7WeluY0G4uXlpIet9Tg7zWPVOfL8e9c6kYbeJSib5j2jMlM/6EDFU
	P5SSlnRIKsO3/eoMO/LktLXuVFY+LMha0PzxMtv81Cwl0dbBsUbm7q7geQmA5EQmReBXGqMBI/HXy
	OqS7HBTurzmtDzwd60yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgZcr-00016R-6J; Wed, 03 Jun 2020 20:04:37 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgZcn-00015p-Dq
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 20:04:35 +0000
Received: by mail-qk1-x741.google.com with SMTP id c185so3563655qke.7
 for <linux-snps-arc@lists.infradead.org>; Wed, 03 Jun 2020 13:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UoYVx4uK8KifIhrxqCZCEy7uZe0Px/LS7EL+AJaK0aU=;
 b=HiKvLeuxVeIl36h2tU9B54qWUncRj/Bgjstb3HuJhY6I1hC+9FnyQ9IpBQjy/Bf7LL
 ZpE6P663pZOwHAabrMx2z+XHRVa40AOFItHheD9D6C1w6iNl9dvB1XZdqEEHiObIgYlC
 HnIGv6cV7mormNWBTIIh8zr5YtSM5ns0SEy96Q4uYoNd/n69mzJFpYyQkBGqf5+yL4Pv
 /oFPIp7KCSG7art1JmYWfYAd2ub6LS1Gmly62Nqv2wAe6hZg+CxFAQ93dpyNlvuf700/
 oA+rJTQ9tYfTJdRXEvheJdjHknvL5mb1rHBfJhcd88iEOryRu6WJC87jF3XtPmh2RDF0
 v71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UoYVx4uK8KifIhrxqCZCEy7uZe0Px/LS7EL+AJaK0aU=;
 b=fUUOKikKKEMUxSYedQ/eIxX+BmktTNaKkfSYu65KNlwxyM1q9tPmIL9Q/0NUZGbwmd
 JETyfFHl3sic+zBPlZgy9OcW1EVkhK19lTuRlIrEIjPX7C+mM4j4c2j4mGKpwZwd8qKK
 3BjmSF6wrC30Z0Gf+nwb5Xd32tfMgQ8ZAHqIiC6kYZ8Lm48L4p6EsZawEkJK02wG7sJz
 aHSxEK8QhMDirXnnjfADuKnf2KTxL/xUtfolU36N7aX/6qf4JlGidYj14f9QpTQOgmxG
 nDS4a7L8DzGyNdYZGc0/HVj66l7voDjmCs8rmKtSDnrLzp6sTWlSjCkq9nxjD08DCFzY
 ivbQ==
X-Gm-Message-State: AOAM533v3G3sbZTUO4Q2yDDHILJfVWKS4dxEp0qfQPMHnqLar1RLU2ya
 iIeSOItXGD6RS59ejZLVGOdmLFvPbmM=
X-Google-Smtp-Source: ABdhPJy6emsvYSXkxcb1ZzR0LDCRTxD/3qr8ou1cfZn/W6lj6hVL2c4lndy4ds6Fg2tb/wUGmxQv0g==
X-Received: by 2002:a05:620a:5e9:: with SMTP id
 z9mr1299022qkg.459.1591214671975; 
 Wed, 03 Jun 2020 13:04:31 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id g47sm2925858qtk.53.2020.06.03.13.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 13:04:31 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-8-vgupta@synopsys.com>
 <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
 <b047f6c9-58e5-c78f-d949-52ca288d3fa5@synopsys.com>
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
Subject: Re: [PATCH v6 07/13] ARC: Linux Syscall Interface
Message-ID: <f5e57119-d034-c220-4235-4e57a3bae015@linaro.org>
Date: Wed, 3 Jun 2020 17:04:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b047f6c9-58e5-c78f-d949-52ca288d3fa5@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_130433_534964_7CC8A043 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 03/06/2020 16:46, Vineet Gupta wrote:
> On 5/29/20 9:49 AM, Adhemerval Zanella via Libc-alpha wrote:
>>> +	; ----- child starts here ---------
>>> +
>>> +	; Setup TP register (only recent kernels v4.19+ do that)
>>> +	and.f	0, r12, CLONE_SETTLS
>>> +	mov.nz	r25, r9
>> Do you still need to set it since the minimum supported kernel
>> for ARC is 5.1 ?
> 
> Right.
> 
>> It should be safe for internal glibc usage, since for both pthread
>> and posix_spawn it blocks all signals including SIGCANCEL and SIGXID.
>> However this is still small race window if this is called directly 
>> with pthread cancellation or g*uid in multithread.
> 
> I'm not sure what you mean above. Do you mean not doing this in glibc and even if
> kernel support didn't exist should be safe internally ?

At least for internal clone usage with CLONE_VM within glibc we explicit
disable all signals (posix_spawn and pthread_create).

> 
> fwiw as mentioned above kernel sets up TP for clone (SETTLS). I detested doing
> that for a long time, give ABI implications but ended up doing it anyways due to
> an actual race hit when running uClibc tst-kill6 [1]

We explicit disable all signals during the create_thread call in pthread_create
(b3cae39dcbfa2432b3f3aa28854d8ac57f0de1b8), so it should not happen on glibc
anymore.  However it is still an issue if application calls clone itself.

> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-October/004480.html
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
