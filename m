Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56104C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 21:36:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E4120708
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 21:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jChm6hon";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X5Ikz/y7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hs8Lw/Nu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E4120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bgUtQEnbAF17EZNo0Cw2KhfCBfAGD3xCVADUVM0kXEU=; b=jChm6honMwwX3caI7SshSW5f/
	Eu5KgxUQJcw6eYNlKd9CykqpUSi1zWfP5tGusfw+Ww5BTR6U5Qr/fVW20WO+7pU71Ssp6QSEWEXSk
	KBlezKH/ZfUHQDbKkRjNQNSITvebCwj/IeXJrAz206vLKFEDeNy8kmi14OrPSUvWGH0URme5DFX29
	1fQXRmTGc8/uxR5DywDsQCOdPj1J20vtcHGrKRY1cdy4usEb7aJFuN2ST1lsrO57bpcwahNczhX8/
	7+ACmIaX3yt0e2w1LlTMPTdzKDbpp5I6ONssgFnu0Hf1xd9TYYE6uLBjEigGsS4Zx+p9YO5nkwI3H
	2C8TLFi5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jteDJ-0003yb-Jm; Thu, 09 Jul 2020 21:36:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jteDG-0003y9-Sb
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 21:36:15 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45CEC40109;
 Thu,  9 Jul 2020 21:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594330572; bh=WLnVXml4E5uzw/WZUV4lFFZ2h5Uv+lqcqdRjNEuMAb4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=X5Ikz/y7hWjTZoJ/8tDBrnPEqLijPqo4p86nwUyydvMm4oK1tRXIg3JWkaR36d4GT
 8L867E7rywmaQ6uPyFofUyOPDiT3PCxFsyYezAIcb81j9jZDq+0Dyie7O0yUi59hra
 ZHHayCS8S5Wq8IY86kSb4zcST2SWRUuV2qly1H3c2MOVv2+JWgHdvRChoznUr4buiY
 Gi2rmPk2SHZQ9S3Vdh2/w8r6MwMsFgiVgzPpyhg4zZYlvfdKxXGk+32x5ejYFIiPHt
 BxnQW6qIit6nxAJIjJotKez82BpAiJRUWm2KosazhjIkN1N375LB0GuyFYdCcnPWai
 1yZ0iNsRKzPKA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7FE5AA005A;
 Thu,  9 Jul 2020 21:36:08 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 093C440109;
 Thu,  9 Jul 2020 21:36:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="hs8Lw/Nu";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyqfNXDRgFvVnd8OZoc7I71eM0oSFmCRypGyGYKSpUkNqGMdoxCq4124l2E6YJESOQ5wn1xaj/7WRyX69Vgs0QGESJBwdSPp2QOI8QALiMKpXx63ZYTkr6mFU0h7O0aMO68OWkMwzmNlnRc9PBftzau1qpYKn2cWkQpKcHwQ8OOzGygSdJaMOVkaUrYQEYJLlchtw2ucCoorq4ctJ2P1vToJTNGKtY5JG+nILYb2AVJ8V+KiiuYATkuzf9jh3GVK0d8RWCrUiGZiUKAxZlcND+/40ujONyCFoFquNSVefHiQARdHNSrWqzZZY/XuwpKtfdTOXSMfzdjUa2CiHvznEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLnVXml4E5uzw/WZUV4lFFZ2h5Uv+lqcqdRjNEuMAb4=;
 b=Kizwwk57GYzyhRIf8tKW0KHO4GzIW9JT4F9VRg69I26vQLWtY/arvBqhzHupuRV43/FKMY7IFrsQQyNry6gCZWYdCEMSlF+gZ/efsCz9lFU27GkrTkKrHQiXeE7svnmfbty/rW+XR7ToTIE4x1R+/bGkfTiI7xhiI2KQiyuKi1/HKACn3gNQlwYc6S8/6sZ1OeWFBKY4SvP+4fWDMNASGg2SQ77lXOs68vd40zBy/J7E1k58c2r+wcOpXcmCFBmIwJVJ01MfwqiQLETefuUDR6Xu1nZJgyT8qjouZk1uLHER8MX/YI7s0w0Y665V57el8cDGbVdQ10v2XyL4obQ0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLnVXml4E5uzw/WZUV4lFFZ2h5Uv+lqcqdRjNEuMAb4=;
 b=hs8Lw/NucpJsAGAL+0/HDfUbFH8ipG4DPdxFDXPEC9HOQgrNKsmtZIBvPkXz8Sd0H3EBkCxLrq46zP7g/qdMzD5vI6yBG3xH9UVd4zgjhYIeqz/WXXaaDt6I7SKtFfdCiqsbMCZlWKvhA0FhHDgO6f5cC/GcDhMJ473kXmegEbE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 21:36:04 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 21:36:04 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Topic: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Index: AQHWVjjy32kEybdCoEKZf9ozCP0tuA==
Date: Thu, 9 Jul 2020 21:36:04 +0000
Message-ID: <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
In-Reply-To: <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f278420-74f8-4f24-312f-08d824501567
x-ms-traffictypediagnostic: BY5PR12MB4051:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB405179136C4209C746E3A707B6640@BY5PR12MB4051.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FyHyatQ6uOjwJj01r00CeAMkP0ZYbXu3ZgLFffY2I0TocrEgxGosQSf2uPIFnD7tHQMW6k8sjZPlj5UfUQO3AvI7GRdXM1d/+8/rWIZpgLXEYX3P40Kd7xkSo6FSMZDsb2Td3MvN8avegQRa5nYmy6y9+CShm8s/ZNYaJ5DVkYGhPkejzAsQHM8SvzNFeT5QpMwoo739XeO9c3v3LrtIN8+Cn3W2pF437mY5I9sya7wpMcSOj3H3lhpU9BuqlpOtKrWC692yfEYdfMQfewPF62S+qDjIkMn5ZY3Q7TbC7yKxMxc5OnYXjjyCbKCodTLDLb02w76Fqr6xHecCIpCWdSwWLi+tm5cYF8DajTJyxTmloxpy90N0+OOj3ab0uAk5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(39860400002)(366004)(396003)(376002)(71200400001)(36756003)(2616005)(4326008)(5660300002)(83380400001)(66446008)(110136005)(66946007)(64756008)(66476007)(478600001)(2906002)(53546011)(6512007)(316002)(186003)(6506007)(86362001)(8676002)(8936002)(76116006)(4744005)(31686004)(6486002)(31696002)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 19J+h6soixoeZedtdTe/IzbFytPqILh18JutUsfe+GXNqxrZCM7kFHM8VmHiczdOkYn7A25hPuj1+ll622Pb9Iw3z/rgqXx49jDFhJ7P2qcpfMhlw0z6sttWz/RjOHfxtJ6zZCgcR23PwYLK3MkebO8yMl3OeVAA59nKe56SRUbcfhKUfb0DpnG+AeDxjEV60rI6j7zv7jxTbdcxcPXetQ3hqkFZ9CH0zp/avEB203vJWLVBGGQXRxWJpuDCVTHK4qERhH3jeyaHk26pC++4nb+qrS9Gmtw0mZ4BzlnfgHGNJoABzzXeLLHJjIyRu0vN7wK+hhMagyuipOnG723uaYv3XTbSOUtRYpPoL9s1JglKsnor1FGra4SdckXQNeV0JdzBmBpJ+J8TM2ZojvoQpfaF787ecsh0d0EDP8z+rMXfaI9ODhoCzbK/J0zoDrLDcibmjGTjR7f2ytYWfaawHGO2A/5NsAi53ZIAr6DOVUZPz3bJSAfrN7SUjcHBqZFsf+vRxdEbhb5lZetTKb2ixNOcTgWT50wZ+zg/pLTmishSuV/hS24a1AyMb0fvdOJe
Content-ID: <3B386DA33321B24E9C4ED06382CF6038@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f278420-74f8-4f24-312f-08d824501567
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 21:36:04.7353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VShE9YYtdDmvMgDn1H5EQBJGc2r6TnTHPxvS8H/vJtuCxy8EPj7fTb8Pd+Opd7mzRHftalkPDeRzhXF97zHvkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_173615_189995_CD31EEB2 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
>> abilist updates). Will do a full testsuite run 
>
> No regressions in sysvipc tests !

But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
"(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
shmctl)"

FAIL: dlfcn/tststatic
FAIL: dlfcn/tststatic2
FAIL: dlfcn/tststatic3
FAIL: dlfcn/tststatic4
FAIL: dlfcn/tststatic5
FAIL: elf/tst-libc_dlvsym
FAIL: elf/tst-libc_dlvsym-static
FAIL: elf/tst-single_threaded-static-dlopen
FAIL: elf/tst-tls9-static
..

Could it be due to recent TLS optimizations...

| $ cat dlfcn/tststatic.out
| .../build/libc.so.6: cannot allocate memory in static TLS block

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
