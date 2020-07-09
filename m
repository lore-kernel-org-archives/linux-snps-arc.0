Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B818C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 22:17:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0C4420774
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 22:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nEPokaLV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HPbS/5qa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qGSNJO20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0C4420774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Ob9xYDe+/3Qtq5tgyA/+v5L5r1aWPAkqqhv9hQqNIw=; b=nEPokaLVgoMvpHbte51w9kAM/
	Lq+onYNkzUj8da8UcZeg5fVyVy7RTQ6AiUBCAecGgZrsg9tgGr7JMEb5BqWcwrDO0/GfsRPEU4Ra+
	Ra5DcENW3oAVeIN6EVEXd4rUqQUnJDz9CBwb+eW1ComLx6+gbMZLcO7uhjfoHJa1U3V2im+pO1/8+
	Q7pSCi+KGOZG2tEkRZDNr0aWjHQkMEecN8MCaZUgr8Zpw7XSygiD9RGK0aWZSNndR3FiVSbehrOBO
	bqae1eFjehewDuFBH9UVN0n9E9RGF5H7FUHAuNHlD2XsRsLCL6wgyaMCjx1hE7BHnTn7DdOol6wgq
	Li3G2HyLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jteqp-0007SA-79; Thu, 09 Jul 2020 22:17:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jteqn-0007RC-5m
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 22:17:06 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5B164013B;
 Thu,  9 Jul 2020 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594333021; bh=b1G/rSaPJF6EUoDBtR2XkU7jF1HNwltRDqW+SPndHXY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HPbS/5qaTEOjm30JUr4uTwUQsJTEhU+21Aubjjx1+xTZm/XmIRKKlvFi0fBJbW551
 +HDy53v94YZzF9Dfcb6BH5A1AKsxWhLqcXLcNFZYZc7dO25eiF3x0NxtBkd648j9yU
 Enyc1+/3j6OsEvA4DNCka+ADLsq6NyRpYrnGmeyIB+WXnW1/ho8ZkTOUxHrIU5rJ/Q
 rF5m9zzTdja61h1jHXJEzY4wYSyNZtTkzC0WZ7I/wvLfOPq97583TxCsCkp2Kq/rDR
 jaTxS7vd9gzXwnB73LtER+/P6gYu6NViA3WHXMkg0Uo7mfScTyFQjSdac1E7CpbmUV
 IExnMUJrFjBAw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7CAD3A005A;
 Thu,  9 Jul 2020 22:16:59 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4036340109;
 Thu,  9 Jul 2020 22:16:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qGSNJO20";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQcPpwZhSdTmD60HnpNyaoXhEw8z+aMTwjfakrQTpfjvfTP+AfLkgZqpK2Fq+isXMySxgh6qXxc4wYYCx6C5CEOBmrfym8hvG+R05Q4Utu+WJxNsOO7i58krto2tHDKZXPUtMj0QiiCPqUO8ysEvvMf6g/nquS1wqwLS5JIlyARM/0HG5w5WVO7jMIgQjska4rC56VS7OBnKqjjlxUQBZGyU/jMXIJuxLYcPzKbSV9xop8j7KbbJgD6gQHNLsI0U+21u+HBkbDij7E27UVJ0ILcKpPTBXvyW0LeQ2haZtKx0+RemF7n0tdEdYMROLpanwcXQu9PqObpRh5bONe3TrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1G/rSaPJF6EUoDBtR2XkU7jF1HNwltRDqW+SPndHXY=;
 b=IOKeoIm9iFEx/JmaeczBZ0P3IzPiExlt7NCsHRhO+fVvks/WgbL4pfacU6bi70ZJo16FHT3JPcJqtkXHDF1LkGqIicI5gZMH6VBZxXpBB7GC7ACpvDEnerG7K9P9QcN/q8gGh/K6sU+p15tj7wUqLklXeZmGMSowUaqA/4qRBhIwC6D8/uZxieH1UC517rNG7gOESGYqn3b7Z53BVwbkbSxNM8bW12KTYBdOUpTUoxPAPpxdYTfCugbtZ7gT60CvwwLYTV5GruahxG1f+gKNSmK77rJ5Mi/AhsloiBvgWRHelOYkJhomGFc0yuw+qChg2xk/RleeZGcZmnqSyohNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1G/rSaPJF6EUoDBtR2XkU7jF1HNwltRDqW+SPndHXY=;
 b=qGSNJO20veMDNQRmO0zJ/k4kMxRwMr3OyJA/h1GvZjCdrsW69IiRNbXPejKQRrgPXQC2+OxrzUSaIj9fh+R2Gd9azlRT+CEaI+RCyTFYGw4V2sRM5RCnTIAxzhOBF9zSmPwlKCr/2c48xPYoT7+x1vGPVVWy673NKIdnUfcXTjk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2903.namprd12.prod.outlook.com (2603:10b6:a03:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 9 Jul
 2020 22:16:57 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 22:16:57 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Topic: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Index: AQHWVjjy32kEybdCoEKZf9ozCP0tuKj/zGwAgAAEcgA=
Date: Thu, 9 Jul 2020 22:16:57 +0000
Message-ID: <5f5dbfc7-17c4-3bc0-39ff-d423075aa2f5@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
 <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
In-Reply-To: <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e3f66a9-cbd1-44d2-bcba-08d82455cb6a
x-ms-traffictypediagnostic: BYAPR12MB2903:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2903EA93147559897B4A3073B6640@BYAPR12MB2903.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04599F3534
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNj2TIcjz2zcCsl2j055gHOlxfK7odf5OUmw8Xtr/w6YsVUxTUU8ZHu4kqyRVCvpEefUc7MUi23gR2UlevyEnKjnQsuxp2eptP6yzVvsZP8pZPTpoy8O4OTIUr+91epN9PKcx9ZR53EY+IjKzoU7mbmuze0/JoSjosHyFjDMg91XVvsHOKWDWBIaFkJTO1XlmUcD5BrVDYANTkL89B4VqBnfzzXNZ3izwkKzDsjMWSqFpN/DMHeCodmqPPJbgMMKj6SpRSb99tG2SnDMfML5vUUesbnunGOEkeCnw1rYkLAq7ZfZ30pXGZLai3o6DMRNNeKd1UjotNQ2p6DtCUDmJ+5JkMe3888pCiHRals83GNXaSkK95QKzCaiz9jSKfyX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(39860400002)(366004)(396003)(346002)(31696002)(4326008)(2616005)(76116006)(5660300002)(86362001)(66946007)(186003)(83380400001)(478600001)(110136005)(316002)(53546011)(36756003)(2906002)(6506007)(8676002)(66446008)(64756008)(66476007)(66556008)(31686004)(54906003)(8936002)(6486002)(71200400001)(6512007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3Ff6JdBHyPNidzjM5bDHwfd1KYRb4I4+6YbknTxBbkoNVYkqOFHFKzKppjzOgi0qkVwfzZmftO9IOvcX0+Obbnp405WeOGQMcYrvzbQwwRRihswymCxHpy65y9jHMJ4pO10En/XVvWzN4EQcMObWj+umLi5U5Yko7NDUy2p/wHTt5gN7fRPvo5dvqiC4lGLjTX4gV/kNI8ytc6uVTf6LatWpyOUuhcvyUIJHM7rHehZaUIufr0cq8H67LcdK4G6R/9hBLaWqH4bKFRc92l9/BUmRHDHlcR1l+zjDwgg0obE5VJlG2HsE8Cl6eldnUo5Kz9+fUG/4yaTk2JYvAlwG5jr5DskaP70oqObiM1u8rX/cXCjjhLRqtO09aYogD2Iy3vACcZS8AnsM8XjlARX1owswFdSAwX2MjLvY50zenwM6zNrGpCQzq3bgZSo2ycOK3MQumv1m4cijCs2o3ZBbICc8Kin4CTlwPfimg5kjyv0A8XkIuJvy6PhirXXQVUVsJrxlp4LVObuB/kJyuGQDBP8i4M6I9QLYB/PQvn1Hx0sDSJO4+OoU7xI0TpcjBPKJ
Content-ID: <61EE28C65102AE4A9407C6B0C55CA563@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3f66a9-cbd1-44d2-bcba-08d82455cb6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 22:16:57.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I98NOAAdrLwLbymmgvOy7m+RpiBN6DykJhHhmjthL+9eGaKOpAxLkqYQprdV/SbqSMMP+XpP95qDFUwEX4cfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_181705_625424_1EEA6CFC 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/9/20 3:01 PM, Alistair Francis via Libc-alpha wrote:
> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
> <libc-alpha@sourceware.org> wrote:
>>
>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
>>>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
>>>> abilist updates). Will do a full testsuite run
>>>
>>> No regressions in sysvipc tests !
>>
>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
>> shmctl)"
>>
>> FAIL: dlfcn/tststatic
>> FAIL: dlfcn/tststatic2
>> FAIL: dlfcn/tststatic3
>> FAIL: dlfcn/tststatic4
>> FAIL: dlfcn/tststatic5
>> FAIL: elf/tst-libc_dlvsym
>> FAIL: elf/tst-libc_dlvsym-static
>> FAIL: elf/tst-single_threaded-static-dlopen
>> FAIL: elf/tst-tls9-static
> 
> I see the same recent-ish regressions for RV32.
> 
> Alistair

Thx for confirming !

>> Could it be due to recent TLS optimizations...
>>
>> | $ cat dlfcn/tststatic.out
>> | .../build/libc.so.6: cannot allocate memory in static TLS block
>>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
