Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF52C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jun 2022 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynYfDnY27TbTgm5Eei4JVpXRJql8o4bYNolQxxHT+zk=; b=VBl2MSrbukDKmx
	7FgM5ncWy2Q15ij70IYHbDo6/efT5CTLLiSBMq5VAV+IVnmYp+WfFXME9yIcPB/m3j8WnhImBimb5
	xdpN/pbcS1fNNnA4CNzqBqAPVzr9ple6P3J82eS2fxwisQ1LnnWz9tSay4g7PulzMhd1AwK9JVgbe
	29QcyCLWS/5QHq6tKwGlgWrwzWTDrrUsXP1ZoooFUL2/H02hbe1sV3rgCcXw4VEeHah98SXDjoDik
	u7vTaepGlXo3KwyZbZ06vWcZEfGujL8h4Hro9wUqv/rhYS2nIhhvHHUKFouzAMcGBxANQqVCaNW1T
	fFASVQUPjsI6AahuU+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Hhg-00Dyfc-Vd; Thu, 23 Jun 2022 07:56:41 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Hhc-00Dycx-86
	for linux-snps-arc@lists.infradead.org; Thu, 23 Jun 2022 07:56:39 +0000
Received: by mail-pj1-x102d.google.com with SMTP id go6so13288595pjb.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Jun 2022 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=52DOKUmijPrR1llFW9K3DBIew/ljlnTH6iwCtWc1Dcw=;
        b=exQnH0NQbD26Rfz+zMOaKrsn9PANlcA9Lv4uS4pbvNApPEF7QMuYvgKaP8SoEPjHPN
         CeIOcPQy5Bgl6x3/PUA9e+SwYRvohXoQpAEvSVgcCBGVZqNoUVJM5P7NYald6MKEyOkO
         4DzyCvykmIZtkgBnANfHPcsfKorJF4SjFwTJZ7+Lsn1O3dyWwH/HL3G2b02X1tbnFSG1
         xY5mAccjq6mocIz68F1WL5WT4ChDt1eWSfBDVVouNF8q/ACxNV+rhrcQT5CPpJ5CIyW6
         9ri04H8gIFDXjuwcK5OLNNCM4Js6DdbLExipOFQNwxVZW71UsXXPR22s9f5EmyrDBLpq
         G4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=52DOKUmijPrR1llFW9K3DBIew/ljlnTH6iwCtWc1Dcw=;
        b=K7dyVCX0IrBrt0qdmFYhC688FXdwkXqgxCb9TsM/n8pVDg1MV0wgofO9ldIfYP74xS
         VkCHrj/wqNopnu2xG0icTA6/7ySVkCcQCojxyjGZ3mnSCN/3ADRdUE1Y/4oiVC5K6piR
         4dRjjwLpXjZP6Vf67e0MOXnFn0r8DqQdkNKQMDlYaEHBMJc7btp+i6avcs92NHaauZum
         n71ZDDf1jZ1wbCERHS0o8XUzp4RHpZcMi7TH4Ay6mlQDW14Oa0rQUJJ3juKiuqJ/syCP
         6EunK/MVyg7zbgUlQ4rzSa3d7KYduvQGoenyvq6MeOMod3oJ5iO6t45NzP14ecKPrz2p
         wRLw==
X-Gm-Message-State: AJIora9cGnFvzJ6sinz1tIaGwrwFawOBT5gjP6ZpPozhY6zIRDfAQY9M
	bUmRKRNpB/PccqovG3Qu+f4=
X-Google-Smtp-Source: AGRyM1udj65Ge4ca9XFsOJwZwt9pFP2X01j5Lj0HcNbhtI8hHeiq88W2Din8RIUWd62QMSAqgA6W/g==
X-Received: by 2002:a17:902:9a97:b0:168:a97e:2457 with SMTP id w23-20020a1709029a9700b00168a97e2457mr38139523plp.33.1655970994002;
        Thu, 23 Jun 2022 00:56:34 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-43.three.co.id. [116.206.12.43])
        by smtp.gmail.com with ESMTPSA id v1-20020a62c301000000b0052090076426sm15492531pfg.19.2022.06.23.00.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 00:56:33 -0700 (PDT)
Message-ID: <89bc29c5-ad82-4f20-2855-44e57b043c49@gmail.com>
Date: Thu, 23 Jun 2022 14:56:28 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>, Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: Julia.Lawall@inria.fr, rdunlap@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
 <d104124c-5196-bc80-b3e3-0ab55f0cc35e@kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <d104124c-5196-bc80-b3e3-0ab55f0cc35e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_005636_351270_D554BCE3 
X-CRM114-Status: GOOD (  14.80  )
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

On 6/23/22 09:50, Vineet Gupta wrote:
>> The patch is OK, but its subject is wrong.
> 
> Right.
> 
>> The patch above isn't fixing any syntax errors, but rather minor cleanup.
>> The subject should have been "Remove duplicate 'to' in the
>> flush_dcache_page() comment".
> 
> I'd just say "ARC: mm: fix typos"
> 

OK.

> In an ideal world yes. But sometimes maintainer complain to break whitespacxe fixes and such into independent fix. Also as someone said later in the thread, for somebody just getting into kernel and figuring out patch submission etc this could be a perfect dry run and helps improve the code anyways.
> 

Seems like you missed the point that it's OK to have typofixes while
doing other real changes (like refactoring) in the same patch.

Quoting from [1]:

> My opinion is that trivial patches like this are fine as a starting
> point for new contributors, which is why I acked the previous patch from
> you guys. However, if we start getting two of these every week it just
> adds more maintenance burden than it's worth.

I tend to agree with the last sentence of above quote. Let's pretend that
I'm the tree maintainer. Besides reviewing real change patches, I get
flooded by these similar minor cleanup patches that I need to review.
Some (but not all) these patches have issues (say subject or description
error) that are repeated. Lazily speaking, I'd like to privately notice the
submitter about the situation, and I withhold these for now.

Thanks.

[1]: https://lore.kernel.org/lkml/0308c92a-0e10-35a4-928b-8f715a7bae44@linbit.com/

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
