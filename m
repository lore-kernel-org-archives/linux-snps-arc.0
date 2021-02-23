Return-Path: <SRS0=19Kx=HZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAB0C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:42:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A26664E3F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A26664E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eSe8Y7cINY9exsT3znLyQU45Rx+HZw27NqkbRR1SIM0=; b=a+fzSxIa5pXvUnCJZltKTRaZX
	uMxzYsv7AyL4nQxdCu8ZgviMcJumnAASSspCLEk2YOWFFr9ZCPb8lSgFbdoXQ1GWlKohD5QODHLC+
	yVkNbF+jSBHkhne8iF+y0PidcYwqF553SjUPTN+4q7WHb3mzjOcBRBrb5BXFPFZ4hr+ZkxdVHHsHF
	8Q22rQboilDyhXsv7p/glbZI8+1P9pVGnBKM+nIlJjcsvZvUMxp+4t6wh70dIqDOv/12ISuBxZUtT
	+QNAZ31xajuKltSozUrruM/BViIB6W2HRIVdBUiWTuMxlDbPMSIjQJKwJiVHstCnk1Mcjm2yqp1wc
	SJLs4oA/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENea-0007Pz-AQ; Tue, 23 Feb 2021 02:42:24 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENeY-0007PL-3u
 for linux-snps-arc@lists.infradead.org; Tue, 23 Feb 2021 02:42:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8A839401D7;
 Tue, 23 Feb 2021 02:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1614048140; bh=mBcSmdOXm87kAw888h5PgJAcwXev9aTNG62Iu0jfBi4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TbXeiA18A6og+UTdlUV53EuvB91HIioUF6ZwJWldfR19WxVRipvbxFHmeQsl5dA7s
 DCXBpuRWbHypAZVNVvMbmovt9kAlADfOAiIvlYLDZxKFNUhAlQkXYX6u5cz59PYvw2
 ETlHZb7q12uNlvkXH1fLO8k4W6aWXHUWcM+EUBJ0BO0b9M/z26WdERq9xZ7xQjQsE9
 YRlweAEbBVNkVFIwAv50DTRIJMSZW6QtQKWgxYSO+XzisOG4P5A6CrrcP11sNgSrUC
 zI2rw+fBrykq1no5X2vHWMvJzQs95jB9M3AXNaJEK465/uMSNy1bllQMjzwuqkO6Hb
 wMmw6yhjm/sXg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1E2E4A0067;
 Tue, 23 Feb 2021 02:42:17 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 33FDE400BB;
 Tue, 23 Feb 2021 02:42:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="e1mYEm6i";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfnN/4cuGVOtpIONiTdxm3WObs2Fgylhbr+XwI27J9eOSNIx95+JKk25Rvw26lGvutwN/wu9OaCdUr90N4meSs6HpjomO/Pcb1+wKqZpWbFohllLqPDfnT6TzUS1hCrLM5glubOMBGrW1ypy7wro2/vaPIZpNuSR1TIvB0ayu8UwDlruAuBu751g/59ub+IQrYtPX3Ok/Mh49SopsOUFib9MTK6taWHLofFl7j7IDtfiAn/BfUesVXvahPnjyspx0f4cc2mEx8vi7B7N8vDqbDqwKHL8a04j+GzetH6uhd+oxuaDgFP/je/Zvi0plJhjujs0QG8VP7rPEGyrd4HJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBcSmdOXm87kAw888h5PgJAcwXev9aTNG62Iu0jfBi4=;
 b=JjWpXdPFbf4/AkQYs4nPlVUTrIo7zYlIgapjceltC1y/lwFA+kpXJIoN+pzphHjzkkxDgnG2CJguFqaGYTihP9magfQWkx3ro2S/hBUZLhjTDXno9k4G52LOmQGvBwpyerIX+RaFxiEAmi122b7l9FviWkmPxa+Y0toERWrZlFZEUAUh+5B0CAT/xC3Fl6aif2soUkdlKaci3CjsSW0iT2zZ3o/JlvcdYPyukWYkyQTGUe3KRiKP9U7iyD4gaX0Yy3no3prJT43VQzgru1FkU+wRDLap4xVGRI40WK9ecX8KEX+NpSsql7BOhGi6CiqkozdEKXUJFf48GyX7PMIvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBcSmdOXm87kAw888h5PgJAcwXev9aTNG62Iu0jfBi4=;
 b=e1mYEm6isXlB1vzSvpxrwW231udc7KemXHxPeIiDaOjr2A9cjqpx52KZjqNVByF3Lb90ULNlUw2eK1i5iO/tZkErYKF0jEsK0FJyO4H/R9SU3JReTsjo/cRQ2PLM2nMSQBGR0+NAIO6OuRixRFT2tZiA1+VwKp8YtKMgqXLsX1o=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:42:14 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3868.032; Tue, 23 Feb 2021
 02:42:14 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "sz18665958617@163.com" <sz18665958617@163.com>
Subject: Re: [PATCH] treewide: avoid the ponter addition with NULL pointer
Thread-Topic: [PATCH] treewide: avoid the ponter addition with NULL pointer
Thread-Index: AQHXCYhEsi7SfOW3S0KbsTzt3RkltKplB+qA
Date: Tue, 23 Feb 2021 02:42:14 +0000
Message-ID: <19bf0aa1-44db-4bc4-d193-32191d031874@synopsys.com>
References: <20210223020031.519-1-sz18665958617@163.com>
In-Reply-To: <20210223020031.519-1-sz18665958617@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: 163.com; dkim=none (message not signed)
 header.d=none;163.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 979b426a-4de2-4df3-b51b-08d8d7a4a0e0
x-ms-traffictypediagnostic: BY5PR12MB4050:
x-microsoft-antispam-prvs: <BY5PR12MB4050666894E8D840D2E20252B6809@BY5PR12MB4050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4cykcUyNVcYzxV5KHjt8oqybjMKmRGhc6wAizgJVSlavVLuRwQz1pTeME0E1CEOaqy/l6wiq6HHQfHGge8/SjZebHSa7h8hLJK41pLhGFL0wZ+gm0YNT0ohTcEtwKPEGeO4CeZ/7HOxxcymQ807jTfA/kEh/TvG/xIQFzgoDt69j8oGNXpIS+bKmb4mahUYbxZizEwmJs1GweRWB5P0t3/2YyLUj03EKEi+I482prXhT7PE5NNH7q+a1IlloX6E1q8Cl2Ymi8CyJ4GC8P45uwonfFuirCgzFWzaVegXrYoK2EaDkiyaIU6m7lDCwnTFU+thUfjPRvukmv5sZLlQCce2ccsiVawoxca5yKukMTqeb1BM7x6k/aN9419qq0TSSOTUeuukeo2hJJ+GzkMN+JmjH4YMbhCvQpU2Bn2zHFmv4PT/Tmg3G4RoQXBq206VaPfVu9rwWK29kCPJHxKkfbEJqui4QieYokrNg/2MfapDaQDhJpDtzVu/5ORxeVAm7BLX2za4pGgBu5t2Ce37aDQBQoARuKgeLX5FS+MOIIu14Hk8nUwNwGJtDVyCjYb2buPE4CugEOO/oFwoTEuqnbYLhTrfRmB82APVpg8M2BTE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(6506007)(8936002)(5660300002)(83380400001)(66446008)(8676002)(66476007)(66556008)(64756008)(6486002)(2906002)(316002)(31696002)(66946007)(478600001)(6512007)(86362001)(54906003)(76116006)(31686004)(71200400001)(4326008)(6916009)(53546011)(2616005)(186003)(36756003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WFUyNExrcGh2RHZoUUJFN3p3TGVVeFBaOEwwSTBTWVBFUzMrQWpEY0RGb2cv?=
 =?utf-8?B?TUUvdXNjaG1GSWtFNlJoSXM2VFEwRjJxSC9PYmd4eGNIU2Vid2xSdzltYUZy?=
 =?utf-8?B?aHdZemV0bXNESHB0WS9yR0dHRm9FdFdwci9Dd1VsOHJoSmxiTmhSOFhoYUgr?=
 =?utf-8?B?MUxoakZtKzViVlR4RisxSlJTV2pxTlE0K1JaT1pZWXhEZHJZMEZvYmNudGFE?=
 =?utf-8?B?bW1PU2FITlRYVmVnNWVIMWtjNkVPL0RqR3YxNzFsRGZpanBVVXgrKyt5cGFs?=
 =?utf-8?B?NkxVY051UU1yOTd1U0VEVUNqaEp4VWw4NlpBcGNpOTZ4Qmd3NDU0cExuUWda?=
 =?utf-8?B?NW10SmE0Q1FLcm5EekNFcGJabXdtVDV4YlMvNTVSRzMwS1BJemplOWU4MUhX?=
 =?utf-8?B?YU1GajJhbHVYL0QxSHF3alVVMGJpVzF1LzVtUXUrcjhYbGpGME4zYzBYMzhL?=
 =?utf-8?B?SExDUGxPa1NpdE9oNW1TZDg3c3BjMG1Ud25iamNWQmZkMG9JdS9OM05FNEFm?=
 =?utf-8?B?L3J0TkF5YnRFK3pIMG9ORmowT3ZnWTVNdzZ2TjZkWGFIN3paTEQ4MGpiNFBv?=
 =?utf-8?B?V3BxZjYyVVhhZVJUZTluOFJQWnIvdUlEVXRrT0JzQm1wSmlCclNvVVhyaDZW?=
 =?utf-8?B?anptTFd4WDBmWE0rODhsSGRRbHptbGp1anRFOFdSZmk5L2ZVTDZlOHl1N2pK?=
 =?utf-8?B?dlJXMlFoSCtCSzBQNGh4aUJDUkJyV1JQK2VXdDd4T1FsV08zdHd5d3dGUjU5?=
 =?utf-8?B?enF1dW1BWU5JUEt6cW1KNDJjWnNNTkxaNXNvMjhmZXMwME00YlVzL1FLek01?=
 =?utf-8?B?QXBQUldvMC9kSTFGbld5MXQ0UnhDcnJ0ZEk1QzRGZytDZjBCWkJ4WnhJb04w?=
 =?utf-8?B?Z28wdC9CZEJFU29Rbi9PdmFld0tzRmlYcCtIUVFMUERMOTR1Yk9xT2hZam5t?=
 =?utf-8?B?ZGVvdjdLNjNLQWRVb29hakhQc3VndU9wODRZRWJxRFpHa1hkS3ZuV3cySzRk?=
 =?utf-8?B?Q2VwMC9rdHRiL1FCWGJCbjJOMEQzc21JVmpWQzRIcUdBUHNqKysxOGZVYmRU?=
 =?utf-8?B?eGljMGwxbFAzWVFyeUp5UDZ0eUViZHFFL3gvTXVjSXE2Z09uTkgwelhnc0ZW?=
 =?utf-8?B?cnRaMUtPVmNRSlNFMTQ1N0Y2WWRWMW44Mmw1eG4xcnl6WDNXSXZoeHIyUUJv?=
 =?utf-8?B?OHJydkExUnU0WEhDMnNPNTNlZXVHWU5xaWtPQkhjTXdXY2Y2ZGtmSVRsRlJl?=
 =?utf-8?B?bVN6bHpuTXZJcXNpeitYM2FlbW01VVJ3QTRsaFI5S0hFNlEza3RTLzNpZnJj?=
 =?utf-8?B?OU0yRGFFazM1VmFzVDNKZlQ1QkUzK2ZlQ1VBQnZ4QktRdzh1eVphN294R0t4?=
 =?utf-8?B?WTN3U04vS2gybXNWckhJODMrNmV6Y1FhUDEyVjhURHVWTllIRzU1dERTS09F?=
 =?utf-8?B?Yll3RUpzVjhaa0ZVR2p6MCtoeDZVYzJkMmJSUkxuSnhhQUEyWjVsSUhMbEZ6?=
 =?utf-8?B?UWVSRVdsWHQ5cGk1N0ZXSEhkMGJQMXNZdEhPaHdveHBEek1KMlF6WmtpelBS?=
 =?utf-8?B?K2MzQm05WGJ3VFJHZHpuR1ZpZEJCcFJMZFkrZ0ExbnJpMFBPQWxURlZlZjVV?=
 =?utf-8?B?UGhKL0xUOEJNL3ZnNE82VWZmd3BiZWtZSWRFS2lNTXZNTE5yWkMwRGFueGh0?=
 =?utf-8?B?RFFvSk9Ta1VBaFVzUENDUkltK1dtbm9rYkFEbVpJWm9YMmMrS2lwc1FsMVpB?=
 =?utf-8?Q?5P9be+udpjWA7+6ckU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <DC6F57AA2955534AB790ED9AEF5A6BB7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979b426a-4de2-4df3-b51b-08d8d7a4a0e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:42:14.4745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfpTFvy7NtJnAZPg0VW9w9GiTiHjzbFGdTdF59moEVT4RzOvFodGIUZucnnNHA35QsjOQ6m1PJSaKHyQTCNkxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_214222_460286_07C778B3 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: "dean.yang_cp" <yangdianqing@yulong.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/22/21 6:00 PM, sz18665958617@163.com wrote:
> From: "dean.yang_cp" <yangdianqing@yulong.com>
>
> Signed-off-by: dean.yang_cp <yangdianqing@yulong.com>

LGTM.

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet

> ---
>   arch/arc/kernel/unwind.c | 27 ++++++++++++++-------------
>   1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index 74ad425..47bab67 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -187,25 +187,26 @@ static void init_unwind_table(struct unwind_table *table, const char *name,
>   			      const void *table_start, unsigned long table_size,
>   			      const u8 *header_start, unsigned long header_size)
>   {
> -	const u8 *ptr = header_start + 4;
> -	const u8 *end = header_start + header_size;
> -
>   	table->core.pc = (unsigned long)core_start;
>   	table->core.range = core_size;
>   	table->init.pc = (unsigned long)init_start;
>   	table->init.range = init_size;
>   	table->address = table_start;
>   	table->size = table_size;
> -
> -	/* See if the linker provided table looks valid. */
> -	if (header_size <= 4
> -	    || header_start[0] != 1
> -	    || (void *)read_pointer(&ptr, end, header_start[1]) != table_start
> -	    || header_start[2] == DW_EH_PE_omit
> -	    || read_pointer(&ptr, end, header_start[2]) <= 0
> -	    || header_start[3] == DW_EH_PE_omit)
> -		header_start = NULL;
> -
> +	/* To avoid the pointer addition with NULL pointer.*/
> +	if (header_start != NULL) {
> +		const u8 *ptr = header_start + 4;
> +		const u8 *end = header_start + header_size;
> +		/* See if the linker provided table looks valid. */
> +		if (header_size <= 4
> +		|| header_start[0] != 1
> +		|| (void *)read_pointer(&ptr, end, header_start[1])
> +				!= table_start
> +		|| header_start[2] == DW_EH_PE_omit
> +		|| read_pointer(&ptr, end, header_start[2]) <= 0
> +		|| header_start[3] == DW_EH_PE_omit)
> +			header_start = NULL;
> +	}
>   	table->hdrsz = header_size;
>   	smp_wmb();
>   	table->header = header_start;

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
