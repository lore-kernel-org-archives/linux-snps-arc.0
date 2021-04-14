Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D02C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 09:28:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D938D61222
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 09:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D938D61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cU4SAstNMjbjQR9u78QldaXyxOy2q4FrTeQ4tGe5+p8=; b=Qm8EjY1bmix61O8948u4YFWHS
	dB3cp5ySgtr5ic7y2kTAjNV4IyaOeRx5p6/WUm3RixwmY7FNJov6d4CeOK1XBE6S3pAYE7EUgRe+1
	cAjIQx7tkUqfF2ta/eHFcOi0ysxhQE59brZokebrKLvQ7GK8WHWUujgzKEtgOagG+DGm+2ycLcJCQ
	YMIlkez69KzBNqg0pCj5TZmieoNw3k20Pq3GkaEjcOBVtfm6zybLLo9w7DEIo45PsWtbOdCtfgyhL
	6vlKt+Sxmlc4Ph40WOe9ptOo+FQ8IdoMTVWm5tgboeiRA+RJmTX9kRTM8+7ZpMfB26oHWNh0RxZ72
	+SFg3CxLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWboq-00C94F-87; Wed, 14 Apr 2021 09:28:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbom-00C93u-Pf; Wed, 14 Apr 2021 09:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=; b=aKHT5RO3vRni3DxVIM6plMKCJi
 BLWh35GrVpwnbXP7K5yvgH5dEVdczJd9/Ck6kvUI1iPzXEkkIojU4y3VAK9nizRAJn39cM7JJZ6bz
 ttYAFDHjS7ElyEnkc3YDnP5ibrAOxxN6EDu7YxZpQRdRFkRkme/VVXTvOG+ZEh38j5wmD689lMrI/
 Wk8G9n8N8i15OgC6rWSuajVDmimwiVZ1Lq2QRlsk+c7zL+PnLK+T9yDvKJ/PKSPywK48wAWPWlWOl
 ths6RZKTAeD61ciTvjjx2XqmDvLYOUgrZdhWlaI7MFSAOAK1/JLx4nkMrqRZ0PuuDeI40hnbQFRbT
 a6HosVcg==;
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com
 ([40.107.237.50] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWboj-007eb7-MX; Wed, 14 Apr 2021 09:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWfcPYzyYgdp2Z9UdLYDGnFSjv631FQt9ZqJ7mCpdN+Yo7moSq618V2qZAr9L8XqipdN6LqxoCG+HWIM18iRDfa4RiVUlJD90e18r0hywZd0wWTvkY9J0FpgJZTGnik7+G71Wg6y/G8BbYZvHcQD3BvFvHnsXnRXbuDzRD3BZtQcXCZZeBcq8m8Ca8Dy6LSd+dlP4Jk5Ye1XjgDmzYTPAU1M6bygJQIwHMdITceenp6wExDAVlKwJqMuuIYX7nVez2pwkH8h8Y/u1jYi1oSVRbfQ7fLBCADfFIxAaJqXhUrAOV4ZB03kBXvbUIN3vrgc+kuJzkWNAszjaynUk7APyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=SLzQ7Wcpg7Yoe/g5QDjERPjuuj9daNLu1GQ2m+v9E/ptt0qU+/jxH0Y0D9g18eZTEWeALLOoYq8X8jVG4+L2+lTUiAGxQ9pPy1MT3HTZQzt2Q5MWLcgkuvnn4ZOR+FwqgAiSrp0u1VboVOQ9XfTuRHnzj8sOs+DnFbDcrlMOmo8035VcCfce1uWdpsjoM0mLXWKXpRd9VK6gYlpljZfPS7W1jHu1pJB9H6aJAq+T4OTYIpzDWeJEvNDoWMkV2Gpk0K6kHVMCVWyXDcfizZ5pU0CC36/lGwa1r2orWGqczA23qU6YJn0/fkQvV/90IvxVNdmw31G4uMu3tWuYLNdKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=gCK3WosoSkUVj9o0NyAZtww7Lm4CfCxWPidNUpYLeMu6Sx5UhkNxCg24QQa67fD0uHkCEMHNTnFVZcOjBaa2cCpUBa9PoaEBFqfxPsW/Vf07Wth9USxbPqE0dTb/45+WUEE7s4KKB8aP3OTsrqTP+9NQk8lspmbrQc12JcEMy0s=
Authentication-Results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB3622.namprd03.prod.outlook.com (2603:10b6:a02:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 09:28:10 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 09:28:10 +0000
Date: Wed, 14 Apr 2021 17:27:57 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Vineet Gupta <vgupta@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian
 Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Ley Foon Tan
 <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] init: consolidate trap_init()
Message-ID: <20210414172757.3ebfaa4c@xhacker.debian>
In-Reply-To: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
References: <20210414165808.458a3d11@xhacker.debian>
 <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0088.namprd07.prod.outlook.com (2603:10b6:a03:12b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 09:28:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-Microsoft-Antispam-PRVS: <BYAPR03MB36222C312A140D3F2A33A054ED4E9@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBoyky1dSeFRX0Ag+4ecLhEn/iqymRc0DygmvkAJG3qhX3BIAN+gpVB9ehyrxpTj5MK7V2fqC98QUaAKJlZMdsPp97mbd333mEaHQ06xvJ69BvHY7r8u5+tXHNuaxLXanEpftcMrJpg3RyQzLUNUYkD/+cGEy2SooAnCRWom7NRVDIkROqXPpJ9HXVWls63l27z9Q0jSLyakwF0dlu5mapmrbbVXVznyMqcj8wBXjQ6N0l4dETrBMZRqv7d9qixkbaWGZENrVAeCEKyAE8sw51HK0gqK8jhTXqVPuBBMs7vGDEN4G6ATNEwie6nGfBVKpih5ws45GL/BMD7hLHTuMVtMSL2PRW7HEdZ/F1Z9WijnNxPK5/Y6C8oXlqf+6EIR2B94+Q1QGLy5ASTmYack67TxVQEHXBRuJFYTb9p8dhmzzf1ExxyjWZMAsSo6O3pwL8zLWuDxaKOoaGQLC32NjIri66ndEgthYqub92SYWIs2bW3F4oH0xyQ6fnTJOhifKyBbNsp3/bqwtJMe/gZL5LBwAHdzyijp630WfUnMYwNHrefGq3UcJSoNm5A7DTTW3O4XSljjLtkbwtNq8JEIUbeDCnRiGTKaP5mV+/MQ0si9L7/L4HO2NUACU0JIf3ZEj9OZcQmnkJB8ukE0ooeAwl/l+SUPH0nxtUc5DUN0EzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(55016002)(66476007)(316002)(66574015)(66946007)(186003)(66556008)(2906002)(9686003)(4326008)(7416002)(16526019)(6506007)(26005)(478600001)(52116002)(38350700002)(5660300002)(8936002)(1076003)(38100700002)(7696005)(6666004)(8676002)(7406005)(83380400001)(54906003)(956004)(86362001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjY4SzdaNDlMNVhRcjBnY2hJcHJrazRPY0tkN1Z6ckd4YUZYa2sxekI4YXRC?=
 =?utf-8?B?U01vdzYydTljc0tMenhnaHRpV28zZWhCcm5hWGZBNzkyV0UxZGh6ZE5QYVlv?=
 =?utf-8?B?ZDljb0xYb1VtaDRqNjg4eFhCVWNsODV4NzBPNHdYOURNTnEyWTFHN0FJejJq?=
 =?utf-8?B?RWRnSHZ4MFU2c2RMWExMWktqN1ZFbTVSZDY5NjluZHhxN3RuUlozVlprT3My?=
 =?utf-8?B?Vkp5UnNMZjc1U29SZ3MycC80VkhOT2d0OU5WMUg2N0NCajFqQUlwcTd0MXY1?=
 =?utf-8?B?djhvQWxJdUtpMWhxRURYSkZtNEs1a2F0MFVCK0RZVUJSL09FSmk3d0dyQUVr?=
 =?utf-8?B?STNEZTBGcWxyOC9wMU4yWDUyVEZTRldRVm5BcXZPdkY1QnQvRG9qWlNkQlls?=
 =?utf-8?B?OURyUkVueUNVSXhkcFFCWHJ1Z2FyaU5Xa0lNQWV5MXo4LzMvQVNVZ2JUQXY2?=
 =?utf-8?B?SnAvWU13Uk8yZ1RBUzBaUDNvY04yN0wwTDkydE01R2FWcjAzTHRSU3FrSm5T?=
 =?utf-8?B?ZWVsWGUxc2tZNU5jOUsrSmxGS1BqbkFVczM4Tnh6cStRS0xkZGpDQ013OGg3?=
 =?utf-8?B?NU9jcENFVmowV2REZGEzckgrbm1aNWxHVFhMSXB5aGhFcEdTdEFoN2U4Sk1y?=
 =?utf-8?B?ZUxjYWYxSnAvY05qa1JDanRweUdQUWRNb2MwQms5OXRQNGNoUTV1RkdVZlg5?=
 =?utf-8?B?ajJ6bC90b0ZSSnNVVGRlSk53aHNVQXpBNGc0ekhrTVY0K1ZKOFVPc3lyRndV?=
 =?utf-8?B?Z3RTNXlRMk8zT2g2ejZxZldobk5wRWxUMno3WWp0MkQyUzZ2UWswOHl4dVNE?=
 =?utf-8?B?bHJBSTBoYnlQa3VIVWsxVDhndVhxaGtzV1p5UTRsTTV3Z1IveUpiaDR5ak9a?=
 =?utf-8?B?RlJWbFk0R1RPMmFnNFNpTzV5T2ZnYktLUU5wdklQRVNkQXNHUHdJV0NubUFx?=
 =?utf-8?B?NlhTZzljVVljNTRwTkdaOE9EQjVVMEFIMDlWSGQrNzRudk5IR0kxQmF1ZDB1?=
 =?utf-8?B?L0NKS1BONzh4VW5USUlyZWU3WWtObEJXdzE0MGczTzlPcVBzc0FuNTMra21h?=
 =?utf-8?B?cDRtUFlVNDRIUkRXelloVWc5NEJiK1pZa0F4MFVqWU9KUGhwVlNXQk1hL2E1?=
 =?utf-8?B?TUtjS0krSEM4cHA1NjB3QVpxcUZMbC9CZjVQZVJockx1dXBZOUNDbkJ6UnAz?=
 =?utf-8?B?SUlJWTI0L3ZZVFlGZHZlT05HbTEwQk5PdnRuYktiMTQ2SEV0d2d4NkdWMjBL?=
 =?utf-8?B?TS9oTm9mMFVPMnZObUI1dVRWV3IwdCtZR1JQVzd4UWhINFFubjFtY2FVQXds?=
 =?utf-8?B?VUNBeFlIbzNudHM4VStoaHJ1OFB5enV1TEsvU250Z1hHRnF4UDNoUUI0Z1U2?=
 =?utf-8?B?UGZBb2xOVytveDNTc3d3bnN3OFNQOTd2UDJlNW5oRjlrUEc2OWtvbzF3TENz?=
 =?utf-8?B?R3poSllndHRESEI1N2F6NWNNK0NsdzFHZzFxNGV0ZGtUbmR2azBnYXd5Q1NB?=
 =?utf-8?B?K2p2Y2F0TEwyd1RnZDh3OEZsNHVOOWxJMWVENzdUV0xGRmZRd0tPRk9udUht?=
 =?utf-8?B?STd0VzBaQWdVREtDVUJLL09pMmp4TzM4TUhiU21TV09hWmJOUEJIK2dxM0xV?=
 =?utf-8?B?YmZnRTJlNDBSWjlFc2pVTHUycGl1NDNQVmJRY0FZQTY5Szl2TWJ6bHREaktK?=
 =?utf-8?B?Q3FxQUVWVjZoQWRKb0x6d2pSdnRJUVZCc0ZhTjhlWU90ck51VkRCeWgwdXFi?=
 =?utf-8?Q?D3GmPb0EMi3pdCwfFb4tp/A+lzyS75V5Z67/b0v?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 09:28:09.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbSQwoe9+sk+OIeMD2fVJIdjwRYcFjMH/krNmyYNJFJsAtaRccxFVAkceNwNekPD/uStkHEqycl7udIev9Ns4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_022813_765442_0071C259 
X-CRM114-Status: GOOD (  25.04  )
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

T24gV2VkLCAxNCBBcHIgMjAyMSAxMToxMDo0MiArMDIwMApDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgoKPiAKPiBMZSAxNC8wNC8yMDIxIMOgIDEw
OjU4LCBKaXNoZW5nIFpoYW5nIGEgw6ljcml0IDoKPiA+IE1hbnkgYXJjaGl0ZWN0dXJlcyBpbXBs
ZW1lbnQgdGhlIHRyYXBfaW5pdCgpIGFzIE5PUCwgc2luY2UgdGhlcmUgaXMKPiA+IG5vIHN1Y2gg
ZGVmYXVsdCBmb3IgdHJhcF9pbml0KCksIHRoaXMgZW1wdHkgc3R1YiBpcyBkdXBsaWNhdGVkIGFt
b25nCj4gPiB0aGVzZSBhcmNoaXRlY3R1cmVzLiBQcm92aWRlIGEgZ2VuZXJpYyBidXQgd2VhayBO
T1AgaW1wbGVtZW50YXRpb24KPiA+IHRvIGRyb3AgdGhlIGVtcHR5IHN0dWJzIG9mIHRyYXBfaW5p
dCgpIGluIHRoZXNlIGFyY2hpdGVjdHVyZXMuICAKPiAKPiBZb3UgZGVmaW5lIHRoZSB3ZWFrIGZ1
bmN0aW9uIGluIHRoZSBfX2luaXQgc2VjdGlvbi4KPiAKPiBNb3N0IGJ1dCBub3QgYWxsIGFyY2hp
dGVjdHVyZXMgaGFkIGl0IGluIF9faW5pdCBzZWN0aW9uLgo+IAo+IEFuZCB0aGUgcmVtYWluaW5n
IG9uZXMgbWF5IG5vdCBiZSBkZWZpbmVkIGluIF9faW5pdCBzZWN0aW9uLiBGb3IgaW5zdGFuY2Ug
bG9vayBhdCB0aGUgb25lIGluIGFscGhhCj4gYXJjaGl0ZWN0dXJlLgo+IAo+IEhhdmUgeW91IGNo
ZWNrZWQgdGhhdCBpdCBpcyBub3QgYSBwcm9ibGVtID8gSXQgd291bGQgYmUgZ29vZCB0byBzYXkg
c29tZXRoaW5nIGFib3V0IGl0IGluIHRoZSBjb21taXQKPiBkZXNjcmlwdGlvbi4KCkZvciB0aG9z
ZSBub24tbm9wIHBsYXRmb3JtcywgSSBjYW4gb25seSB0ZXN0IHg4Ni9hcm02NC8sIGJ1dCBib3Ro
IGhhcwpfX2luaXQgbWFyay4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBhIHByb2JsZW0g
Zm9yIGFscGhhIGV0Yy4gTWF5YmUKSSBjYW4gY2hlY2sgd2hpY2ggc2VjdGlvbiB0aGUgdHJhcF9p
bml0KCkgc2l0cy4gT3IgdG8gYXZvaWQgYW55IHBvc3NpYmxlCnJlZ3Jlc3Npb24sIEkgY2FuIGFk
ZCBfX2luaXQgbWFyayB0byB0aG9zZSByZW1haW5pbmcgb25lcyB3aXRob3V0IGl0IGluCnByZXBh
cmF0aW9uIHBhdGNoZXMuCgo+IAo+IAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhh
bmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL2FyYy9r
ZXJuZWwvdHJhcHMuYyAgICAgIHwgIDUgLS0tLS0KPiA+ICAgYXJjaC9hcm0va2VybmVsL3RyYXBz
LmMgICAgICB8ICA1IC0tLS0tCj4gPiAgIGFyY2gvaDgzMDAva2VybmVsL3RyYXBzLmMgICAgfCAx
MyAtLS0tLS0tLS0tLS0tCj4gPiAgIGFyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYyAgfCAgNCAt
LS0tCj4gPiAgIGFyY2gvbmRzMzIva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+ID4gICBh
cmNoL25pb3MyL2tlcm5lbC90cmFwcy5jICAgIHwgIDUgLS0tLS0KPiA+ICAgYXJjaC9vcGVucmlz
Yy9rZXJuZWwvdHJhcHMuYyB8ICA1IC0tLS0tCj4gPiAgIGFyY2gvcGFyaXNjL2tlcm5lbC90cmFw
cy5jICAgfCAgNCAtLS0tCj4gPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyAgfCAgNSAt
LS0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgIHwgIDUgLS0tLS0KPiA+ICAg
YXJjaC91bS9rZXJuZWwvdHJhcC5jICAgICAgICB8ICA0IC0tLS0KPiA+ICAgaW5pdC9tYWluLmMg
ICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiAgIDEyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luaXQvbWFpbi5j
IGIvaW5pdC9tYWluLmMKPiA+IGluZGV4IDUzYjI3ODg0NWI4OC4uNGJkYmUyOTI4NTMwIDEwMDY0
NAo+ID4gLS0tIGEvaW5pdC9tYWluLmMKPiA+ICsrKyBiL2luaXQvbWFpbi5jCj4gPiBAQCAtNzkw
LDYgKzc5MCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbml0Y2FsbF9kZWJ1Z19lbmFibGUodm9p
ZCkKPiA+ICAgfQo+ID4gICAjZW5kaWYKPiA+Cj4gPiArdm9pZCBfX2luaXQgX193ZWFrIHRyYXBf
aW5pdCh2b2lkKSB7IH0KPiA+ICsgIAo+IAo+IEkgdGhpbmsgaW4gYSBDIGZpbGUgd2UgZG9uJ3Qg
dHJ5IHRvIHNhdmUgc3BhY2UgYXMgbXVjaCBhcyBpbiBhIGhlYWRlciBmaWxlLgo+IAoKVGhpcyBp
cyB0byBmb2xsb3cgbW9zdCB3ZWFrIE5PUCBpbXBsZW1lbnRhdGlvbnMgaW4gaW5pdC9tYWluLmMg
dG8gbWFrZQp0aGUgc3R5bGUgdW5pZmllZCBpbiB0aGUgc2FtZSBmaWxlLiBJJ20gbm90IHN1cmUg
d2hpY2ggaXMgYmV0dGVyLgoKPiBJIHdvdWxkIHByZWZlciBzb21ldGhpbmcgbGlrZToKPiAKPiAK
PiB2b2lkIF9faW5pdCBfX3dlYWsgdHJhcF9pbml0KHZvaWQpCj4gewo+IH0KPiAKPiAKPiA+ICAg
LyogUmVwb3J0IG1lbW9yeSBhdXRvLWluaXRpYWxpemF0aW9uIHN0YXRlcyBmb3IgdGhpcyBib290
LiAqLwo+ID4gICBzdGF0aWMgdm9pZCBfX2luaXQgcmVwb3J0X21lbWluaXQodm9pZCkKPiA+ICAg
ewo+ID4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
