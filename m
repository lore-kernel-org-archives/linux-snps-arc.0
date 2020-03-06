Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30EAC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 22:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518D0206CC
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 22:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWSNDeLc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TNKWUPYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="QprYgyfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518D0206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAcwVJ/Hl2lMsnqoUCfT1FHPKoyb1DeqMqGNqATCU3g=; b=gWSNDeLc2bySZm
	yMcCW8U6sKrwvHmjH+HnPlkR07YTzoenXWagp09daHF6C11rAd1KOQPj2XKIZ6jZNQ7kdXULdBI6F
	3SgDcvgKHJM0cxvSAzYFh9ghzSrRcFVnyqraSmHuJuxNebRkivcHSf3jYJ3VfIxNSQDBV9s9nOeOb
	9ChiX/KdRA24wLy2td25yn+G3xymR4zqryDG/8MBFWfdWlPSZ1Yw8m83WijL1xn83ZAOwiOAKEH5m
	SVM3ONjydLf86f/Iny+fD1KRqfdr1ON7lRh5shIWmEpmP3L3fJQKZI2WXs1DxkOyaiUPTjufIgtdM
	ORNDY6VkmBpzscW9g+OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jALsF-0006Ws-Cx; Fri, 06 Mar 2020 22:55:19 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jALsC-0006Vs-O4
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 22:55:18 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 662024033D;
 Fri,  6 Mar 2020 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583535313; bh=AppSWQzQ0s2eM9mq2c5P9hzcPZIRPcjpmBfc+n1NUSI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TNKWUPYkqUqyASSMZGd/zNRcN529O+KOH9Q0G086FC1yG2bXswr6qK3TgwZXY1IOS
 WwpJNQGO6ED1cH5tDCCcW208k0Ie++IwyB4QKupblFvveoLPVr7aZ5AqYAEVvQX+F0
 jv8Bi3+XtM4s1YhK0zOyCikz0nER3e1QIvHpe1O5KaPAKVk8sV0fsJum0ezcnankFp
 KY695DpNmIsRHAImQbOl/SAL4efxdp3g7H2ee6sIKhxqfLT4L8+t19bPwfIMJ49vCJ
 Cf/GE9Zu/0BZgNg8E/PCCq2b2cVuAZ3bWRAbaGjl93sR8+hw7WHdIN0n203zi4HrSS
 Vqg7oiFcnD0SA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E7859A006C;
 Fri,  6 Mar 2020 22:55:07 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 14:55:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 14:55:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMYqF3S6v2kyhKnLYuRJ3mLgVXW9RPflHcpQJUr2Mou+yuCD627RbXxoB++tDEbUTi4FTmuDHHT6NX8TWNCmHqVvvlVj6uBfePW1LcMpuNEpP3HF3y3AW2t+cLy0h6INMIdtZ9k4z2bA80jXTcj/pIH03Z/PEZk/gU3qPWfvvLWI+4XUEwqJo3/+7pEVDjUgSFFr5gQtEcThYQ60LXparlGwh2Afg1/8oyKOmuN/1hAAuvdWjV1oTlGO88RA8bbrPWD3Fq2YOel6+guGB3yoHYdSH1SKE6DeWYLMrcM5UqhmnZbiFyMqj/AKnDd9CHWQP3g+vW+BdDikeKJBotHI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AppSWQzQ0s2eM9mq2c5P9hzcPZIRPcjpmBfc+n1NUSI=;
 b=boc6suedvVMFJW2w5EQ6RWyXgM7WW5xUhxY7w40qQLjWiDqoCdQqcl7IMQdadQc7mHIIoeDLdWaKaiYv+BObu1lPxK4IjHBTmrGFDcWIYSWeBAKWiRZYDPY/xfAgd5YjgNJATIlotzYh58/frApS9ufaIHwcF93lip+hPuq6Ox+zo8LzBDigHkvS1UXFQAQb86btSROQ7m8G036ucECus0qK3L8sutFLedOgFjMuEQPrDO2Lba28Ng8c41g9nYZOl/U0KWRAR2bE15/VQzg4TN2LQAoccQcvgexQXQ5g3Kta4Vm1Nkehps1pfGNYzHBG8w+mSuB3rI/T89N0Lkntig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AppSWQzQ0s2eM9mq2c5P9hzcPZIRPcjpmBfc+n1NUSI=;
 b=QprYgyfuviMHrAf4WrIUnlcQa6sDOJp5O0jlD9VU8WEUBRV/G+nYeAl4ks9oHcDW2i7/bB92hjxYBcpCL5hMvIdjxm/Y0ZQycXrGnrPCL15kbM4WXyxuwQXnp85JQwxXKvFZhWzBY4iIGSL1yq4sI56DcTRfZbBUmNE9hfg5WE0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Fri, 6 Mar
 2020 22:55:02 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 22:55:02 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] ARC: add helpers to sanitize config options
Thread-Topic: [PATCH v2 1/4] ARC: add helpers to sanitize config options
Thread-Index: AQHV8ykvVR2JL1YHIE6IOiVJu8OMZqg8LjIA
Date: Fri, 6 Mar 2020 22:55:01 +0000
Message-ID: <3f18019a-0068-fe71-f943-4257a4462d88@synopsys.com>
References: <20200305200252.14278-1-Eugeniy.Paltsev@synopsys.com>
 <20200305200252.14278-2-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200305200252.14278-2-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 394e1378-685f-4ddb-e1ac-08d7c221677e
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2984E145CC8F60F7AC7139CFB6E30@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(346002)(39860400002)(366004)(199004)(189003)(2906002)(110136005)(8676002)(81156014)(76116006)(6486002)(81166006)(31696002)(558084003)(71200400001)(6506007)(53546011)(86362001)(54906003)(26005)(8936002)(478600001)(4326008)(36756003)(186003)(107886003)(316002)(31686004)(66556008)(2616005)(66946007)(66476007)(6512007)(66446008)(5660300002)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2984;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huT+GKthU+MvkNLAGtlZslupjlfyoLfZ1JNAV1Qnr3npKLLWmCUqxV5rTqX5cLRlMDKZLI9jZZdMhyHtB5R5h3TmaWQQFz21vrAusoiJt+29aQekUlkOQYb3IlJvESdeAXwqDcNMh71bAlVXO4jmiubbophejSESuB3HbEoMfrm2gW+rzQJL9JIaYq/jNw/+GwBILSGv0LgDw6kOU2OO+sXOnOyip7C2ZHAd9/vl7MT87mNIWBxWCzq0+UX7vpy+WbdUo/eyr4l4YguNjM+ma9GQsAD3n9W0w3roGfwx/mLWH9w6QNWdntg1e8hgo1I9DEilse9aDXKKInLA17qlyYyEOTAUO8iy7192QSl+CczRdcIAMqcPVNhR2S2KvZCC3My+wECafbWSJh7pmNofDMB6J64D0NLbHejENXUwHZWfNyNSyT8699ivUFa3qc+5
x-ms-exchange-antispam-messagedata: phldTZx2MmARfNvb2Z5Wy1sqEPsJEAWVC3h0KT38I9AdlPg8+T1alfSNWVep8zADlQrJfgSWmrMDQ6eusBS45/y+Jb+mCZ8T6heFhD0avvwfj6pVgG2hmyYBDPy+QgEz0unHaNmZcAb4s1SEsY5PpA==
Content-ID: <C9D9932C3D66C34B80E511134F4266FE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 394e1378-685f-4ddb-e1ac-08d7c221677e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 22:55:01.9933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJvYL6jwJkpRwBLCGtnw/Yz7AnAmpq9edbs6YJLbHZbrvRSocoWLP/X5kSIxovy7Bx67nD+d1SGi8PmLsITGOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_145516_819415_C0B99C11 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/5/20 12:02 PM, Eugeniy Paltsev wrote:
> We'll use this macro in coming patches extensively.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

LGTM !

Acked-by: Vineet Gupta <vgupta@synopsys.com>
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
