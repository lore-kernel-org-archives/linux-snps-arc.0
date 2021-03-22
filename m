Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23FCC433C1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 19:51:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7376761972
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 19:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7376761972
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8y+lxeOsSudcD5GzwX0zP5f78Yf0YDGApnPg4/joQjU=; b=fYKdP9ebXRP0grRThZODwBpv7
	tBEEBgkDFQk04a8cgxyD6woFn9eRzs5floVLowwkjoJmtZWavkiD505BGt2wB4JpPvyNG5DxdCOlO
	WvuZM4SfSY/OonOnuNe5Ou0KTJ7raSNsE+nsKST46lmQgsPcRGkou1e8j67XFOzAIT/3KTgoGpCYj
	zXroOBlJU3Z8dcx3txvqJWPzaxTbKZ+XeXCwTHQ3TY4c1MFhB8USu9NKwwIM/InmS4YA/r7Uo4Sl7
	jU96iCOEhboaJTOFZPx2rsrMG2M9QBnyHAeVVdZxEY/TKTh72IxRByQiNbDRkWR+JFwJQ8r602ofl
	YDalFV89w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOQaG-00CSeq-H8; Mon, 22 Mar 2021 19:51:28 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOQaC-00CSeQ-Lb
 for linux-snps-arc@lists.infradead.org; Mon, 22 Mar 2021 19:51:26 +0000
Received: by mail-qk1-x735.google.com with SMTP id q3so11903542qkq.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 22 Mar 2021 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MYscncn7bZn1Z+8X1ehgy/OBYdwKEuqCWFhBIrPSGB8=;
 b=VMPXEo9r7gMHIUNl/uo/+tvolz7ZMWjlds5ONa4oiOL3D2M5pbxh2cSdhSK/DvgBu4
 28//yMGslr6IvfhBN+ZPSbInADRflacpeVlo+owA2bWU0nviLoueS6FeV3hE332qFjTs
 rwLFCCEhSjs2DgoIIA4RSjpqybbTexj6g4ZYzMkjWhpXNPYhA+373sPyK805WlOmpg9l
 3XKE+ImfdnBfTeNRXGa/IkzzDcJff3Y6aOF9IvEuAPtyR/o6bAB6CTD2aaRw4fAoZlwx
 T1LrkFCU43t176r3DXjNEWFmTuRWN2NKJ6i8cUzK4sClnZVzXJO+FA5F9r/VI9Lyabyi
 D9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MYscncn7bZn1Z+8X1ehgy/OBYdwKEuqCWFhBIrPSGB8=;
 b=sade/K3Mz2IveHJTqj9FhGe+cyvXo/d8+36Vf7ujW6jB2lwqVaO+hsznjJxbzB6X2Y
 i8CihsqABjs0R3eeOboHdanzkmSobq7rZapJLE1CXejSw/EnQb50lPs0BLUymHmZbrYo
 W66UpVv0EaVOfDJyXC36vOFGglCUqvbyCTkmYRJhSRVqjaw8L6uMWu+CaQS8DQoItk5x
 JM9lw9JQUte4ms6C1qYFae4vn1mQBvz2dB3WkFSdbct6r1L3xyOl5+kDSLMODatAjDE6
 n2DAnU+8lqpuI/D1wcQJHebAF7BkUQmrr8Wu7f8pZcucuCklTEbc1PeYzVqrC7QwSdRk
 911Q==
X-Gm-Message-State: AOAM533CaScbVx77q3zWRW7mfDJVESNb16PYNtSIbhiC5AGIxzE2yxfW
 /1dcM158hM/8h/7WxBX4AUk=
X-Google-Smtp-Source: ABdhPJx5EReLVNQDaaUoPQKOV2t3J3Hsn9rNA/sZzJNjxOuuB8lpkkQKYSapiL/kfM8Lz5XZRZmrPw==
X-Received: by 2002:a37:d17:: with SMTP id 23mr1760376qkn.191.1616442682424;
 Mon, 22 Mar 2021 12:51:22 -0700 (PDT)
Received: from ArchLinux ([138.199.10.68])
 by smtp.gmail.com with ESMTPSA id f9sm9721890qto.46.2021.03.22.12.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 12:51:20 -0700 (PDT)
Date: Tue, 23 Mar 2021 01:21:07 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: vgupta@synopsys.com, akpm@linux-foundation.org, keescook@chromium.org,
 shorne@gmail.com, walken@google.com, viro@zeniv.linux.org.uk,
 jhubbard@nvidia.com, daniel.m.jordan@oracle.com,
 tsbogend@alpha.franken.de, peterx@redhat.com, axboe@kernel.dk,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH] arcc/kernel/process: Few mundane typo fixes
Message-ID: <YFj1KwTBcCNh6xYm@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 vgupta@synopsys.com, akpm@linux-foundation.org,
 keescook@chromium.org, shorne@gmail.com, walken@google.com,
 viro@zeniv.linux.org.uk, jhubbard@nvidia.com,
 daniel.m.jordan@oracle.com, tsbogend@alpha.franken.de,
 peterx@redhat.com, axboe@kernel.dk,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210322125155.3401540-1-unixbhaskar@gmail.com>
 <20210322132314.mtky3gx2oqqucoob@wittgenstein>
MIME-Version: 1.0
In-Reply-To: <20210322132314.mtky3gx2oqqucoob@wittgenstein>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_195124_812015_96318AFA 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4399769933271558579=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============4399769933271558579==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="55xydjBtY3xHGVoL"
Content-Disposition: inline


--55xydjBtY3xHGVoL
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 14:23 Mon 22 Mar 2021, Christian Brauner wrote:
>On Mon, Mar 22, 2021 at 06:21:55PM +0530, Bhaskar Chowdhury wrote:
>> s/defintion/definition/
>> s/succeded/succeeded/
>> s/commiting/committing/
>> s/interrutps/interrupts/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>
>Since you aim to be mirroring the path arc/kernel/process there's a typo
>in the patch subject :)
>s/arcc/arc/
>
Thanks, will be careful in the future.

>otherwise
>
>Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>

--55xydjBtY3xHGVoL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBY9SsACgkQsjqdtxFL
KRXF6AgArySyuCmPI1K58rXuFNOJezNjLDKA01ecnzbob7pHvUKiBHV1o6+ulJFv
fzaXEb9wNOOKH9NGw0t0NcMHRPSNWLZW0cHyKnV1bGOIwzH0YdsFaBIRybernRnu
hr+xfYBKqQMN2LxcMLFQ+bv0ssWauHvYFWwGKSUveUI6Pcdpb8fkU0jl5jCOVyR+
cDIs2Rw5mJYhBZJU1dHZCZr6IlXjC79AGdpVnXSjb3u1Wlf6i2zUJCjCp3Ekp+tf
z7frxqE940UWz1/ccEdsSoy2hhcMnDRFO9xWVI0tdNV0TK7vfig6nKG4ayYfBt79
p41CGI4rI+cI4OuLSbARnjuP2zB0HQ==
=8a55
-----END PGP SIGNATURE-----

--55xydjBtY3xHGVoL--


--===============4399769933271558579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============4399769933271558579==--

