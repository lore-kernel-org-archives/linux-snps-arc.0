Return-Path: <SRS0=YFEe=BA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CB0C433E7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Jul 2020 22:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106FC20717
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Jul 2020 22:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kVX08riu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MXHij6NH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HaNtJGTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106FC20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LAPo8Vlp9DXR2EHUzIsxiRvp4mtIlFdqrdL+st2ZzOc=; b=kVX08riuBFdAUhUFSml2h5VyB
	gk2qdLw0jxU/sOTY+CDMo7py/vzTEc2owPVFUeUD6G6X8Xf+3oh8CKigFDkH4Yz/vlTuX0WNR2gZZ
	1WjUJHWLCUgQXOIiO5kUccph4Tj8MlpecZrUgcqimPWGmdzj57AtDSGfU4VVDmKAO/RMYI3c7k0wT
	uDFKZBpIL/PyipUnVg5jF9WvX7Elkn2jb5FpX7se51qpvGXkh9gud143vrs+cwGZoIa0vFyM5d9/q
	m6/Hz76/qS9D7K14pHNu62EGju5WcwOKE50f98v2EXDsuXQs7d6voGbn06g5Xf3hel0LTIHBz1NfL
	rQyuX0VWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy0P7-0007yx-6s; Tue, 21 Jul 2020 22:06:29 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy0P3-0007xH-LF
 for linux-snps-arc@lists.infradead.org; Tue, 21 Jul 2020 22:06:27 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2B5D400E6;
 Tue, 21 Jul 2020 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595369182; bh=XfoA3wDwkQAyGJ0r3ASvxwksdkImsssZAYUimAUEt1k=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MXHij6NH6YAp1bGLKoRtuesyzUA2rpCSX1ZyhgZzrUXuEpYtqGYV0bwDY5jt4px+a
 Ga/YMP9062RbwyZ/GEgHtKdFV/9JqKrZ73HVEKtkMo4vgDemDBys4nsb1l3ZB7603A
 JyemJ4pULIWfdTvdUJc1gnRFG8Akbq7KUQKXEmQG3boC8J3KP30iNdDRsxvatA+PeN
 5mj5+dBHzGg++or7FFoX/lN0NKXVCJFBVGC3PhaQnOZcEOOLgUrNZE5ZD532ORGQpo
 VnLKqKyZ8lexjHHXCh7Zz20D3rBRMKPa84H992p22qhetm9Wc3rgwVVCcb+Pb7VZkQ
 P5FtIwubz9zEQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 669F6A006F;
 Tue, 21 Jul 2020 22:06:18 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A9CB2801C1;
 Tue, 21 Jul 2020 22:06:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="HaNtJGTo";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guCHS2dmguRuPsQnA8pKqUsZu2EMTJ5Mgf1Wb4CsCnrrxxLn3XqmSp6Hs4Puy9ZLoVCjrWVLmq7DSgtuifJlMEgEwolSJPKHotQh0FdtOhzuQlY1IU+22ci9h8E3rZrgD2jWmGBepeRdP46h9Afb1UOXcEdc7CpiEFHeNQCrksz5diwc/LRcaRoItGwpgm7/R7eh7bzC6XCewqe5qMrPlDPCfW7T4ytlrBaYp/q/3WNIFo/UsQsw0tgiVWOuVmzvKjQb4Aq0EPnR3hGEsfJXlPsbyDF1mGkxdnACii0EvL0zoOcL4pByRWAqLlSxLwgAu1jj9n33HsLcSLszB0hD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfoA3wDwkQAyGJ0r3ASvxwksdkImsssZAYUimAUEt1k=;
 b=e4e0UINAlbOFI5UYI/e3xfTJYxXDSV/ZyZv9itkSrdANRMtMks4zjaDywykTkSu10Y2Jrl8foZQIJ0aQZi9eoVKorlgPmCm9aXi97snfuyq8Rf98uwPQivohR81+Wya8g9KNnd2mrGpUc7D5MvSMn4vV1eLM+40bC2FsnYZkeasKhGWsSzw/rvppNATMah3PSogneXtqBpAojOLPJbdydQ+JuHCPDpSNeRGBYl567xvsGXieLf8tcG/wjEMStp04vBEFQx2iefulKjZQsBK0n+KcieUuzHIiH4m+HZuZPSlDPBXnQDaXPAPJd5+GiPokbWmXX/FUFIuViq6vBgzkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfoA3wDwkQAyGJ0r3ASvxwksdkImsssZAYUimAUEt1k=;
 b=HaNtJGToLiFkjV/Xa009OdJwW+aK27tJ2zwK++9zFa7jysk1tdCPVPMyMcL/PRiuWAu1vH5xpbp0TasERM9lvwHiaK75fXL75IyyHHzXUqx/b/Cn0hZo8rDPISEn/TfawKoOe2kkAGqqJZrFAntzdLqLhbPM3OFM7MTULQXVozM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 21 Jul
 2020 22:06:15 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3216.021; Tue, 21 Jul 2020
 22:06:15 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC: pgalloc.h: delete a duplicated word + other fixes
Thread-Topic: [PATCH] ARC: pgalloc.h: delete a duplicated word + other fixes
Thread-Index: AQHWX6Ht/QnQkfU2BESqeocpiml8FKkSlwmA
Date: Tue, 21 Jul 2020 22:06:15 +0000
Message-ID: <faf86b1c-fe64-5614-c212-ab707725f0d5@synopsys.com>
References: <20200721205958.15229-1-rdunlap@infradead.org>
In-Reply-To: <20200721205958.15229-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b55ffe46-3d24-4277-92c5-08d82dc249d5
x-ms-traffictypediagnostic: BY5PR12MB4051:
x-microsoft-antispam-prvs: <BY5PR12MB4051FE5CECE8934866339684B6780@BY5PR12MB4051.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/Wwwobx54ow8YKj9Cz94PfeRkBCrJcx0YeVw09L2+AkoA2aDq3rM7nlXpu3vJLZ1B9AU5pO8bb4ankK99abn1xwfHJmVFAyEFCWR4DlrPdDV+ZYorsM8ZBEu9T8DQW6Sk/Own6uagzfo++xBLBkd6pT60881YutqJsymcFmkPy9eJw+B6oCvtNcr2A3BlOtrlkdsuJZTJf9YUN/LMjlJB0yBso94XkXg/RDQh2DTioIbazhhnLIpFp1vktF4qySo9nNq5wFP8YQ1iXZNAe/zU7sdQgH/WliTETHBMsIDewa1CwJf1Y8r32EfuD0PTfu20I0Dwf7YMaVE/Vdd1rh6lYcj0XBMDeugZwxNvbjGzh5Gi7Kd2BeZdakXhI+m+sn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(376002)(136003)(39830400003)(346002)(66476007)(66446008)(66556008)(64756008)(66946007)(2906002)(6506007)(8676002)(86362001)(53546011)(26005)(76116006)(6486002)(478600001)(71200400001)(2616005)(4326008)(31696002)(110136005)(5660300002)(8936002)(186003)(31686004)(83380400001)(36756003)(6512007)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MkDQBDPQPyhyMOsc/WdNIIDlF77pO49w2Gldf7zha+v045A2dSa4/vo6C9xTaTuxrSxyjQgXd6jP8cL0K7t41692s8T0n4Ld3Oe6Y5fYj6wDfO1Xu+/wwS6KyaBv47fwwYq99PwXlt/ZNiUpHhge/wvNZzHVh08RN3v5NJOPGjowK8FIkei4TQ3gQP28qfhsBflwuJm0u7L9yXcWkOSbXyMLylU5Hvsc/vMV4Z8hYQekKHrZdGuQvs8ZQnhSoRyQ+nDnN9f4sRfVkNXaAldXNWs9yC4vJH7kx3cx7MVzqUjmIvbnYvOKgCbUs1ycP4bFM+SH2UZqhO6mHURHz6P4cT5FyQQNspCXE1mkhH7emlyoIn7cT07tfcWpvyuWuzJ4lWJb2ySzuGxUAgZXV5Shc2g7wAbCyDjhrUwzFOLqgCyXWgQJcC0Qnbj09jTs3P+5M4GIZhHMjpplRU6uwVF9jSt3Tgba+pjnyNfkP30Ra9E=
x-ms-exchange-transport-forked: True
Content-ID: <E82BCA8EFB1A4E4B8ED4159593D7C8E9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55ffe46-3d24-4277-92c5-08d82dc249d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 22:06:15.6115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euGmiozzcvSS1sZboVCMn5aV1p3f/ZmyZGIfK4j4ys6+Age8Ab4VqEbNrkVl94d8LHfJMttuEwzjvMFuI/75Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_180626_115153_E7697B1F 
X-CRM114-Status: GOOD (  15.67  )
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

On 7/21/20 1:59 PM, Randy Dunlap wrote:
> Drop the repeated word "to".
> Change "Thay" to "That".
> Add a closing right parenthesis.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org

Thx Randy. Added to for-curr !

-Vineet

> ---
>  arch/arc/include/asm/pgalloc.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20200720.orig/arch/arc/include/asm/pgalloc.h
> +++ linux-next-20200720/arch/arc/include/asm/pgalloc.h
> @@ -18,10 +18,10 @@
>   * vineetg: April 2010
>   *  -Switched pgtable_t from being struct page * to unsigned long
>   *      =Needed so that Page Table allocator (pte_alloc_one) is not forced to
> - *       to deal with struct page. Thay way in future we can make it allocate
> + *       deal with struct page. That way in future we can make it allocate
>   *       multiple PG Tbls in one Page Frame
>   *      =sweet side effect is avoiding calls to ugly page_address( ) from the
> - *       pg-tlb allocator sub-sys (pte_alloc_one, ptr_free, pmd_populate
> + *       pg-tlb allocator sub-sys (pte_alloc_one, ptr_free, pmd_populate)
>   *
>   *  Amit Bhor, Sameer Dhavale: Codito Technologies 2004
>   */
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
